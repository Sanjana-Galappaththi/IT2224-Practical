Question 01:

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#define MSGSIZE 16

char* msg1 = "hello, world #1";
char* msg2 = "hello, world #2";
char* msg3 = "hello, world #3";


int main(){
	char inbuf[MSGSIZE];
	int p[2],i;
	
	if(pipe(p)<0)
		exit(1);
	
	/*continued
	write pipe*/
	
	write(p[1], msg1,MSGSIZE); //write(file descriptor ,message,message size)
	write(p[1], msg2,MSGSIZE);
	write(p[1], msg3,MSGSIZE);
	
	for(i=0;i<3;i++){
		//read pipe
		read(p[0],inbuf,MSGSIZE); //read(fildes,msg,msgsize)
		printf("%s\n",inbuf);
	}
	return 0;
}

[2021ict112@fedora ~]$ touch Day21.c
[2021ict112@fedora ~]$ vi Day21.c
[2021ict112@fedora ~]$ gcc Day21.c -o Day21
[2021ict112@fedora ~]$ ./Day21
hello, world #1
hello, world #2
hello, world #3


===================================================================================================================================================
 Question 02:
 
1. get 2 inputs from users(//parent process)
name:
regno:
age:
2. print the output from the child(//child process)

name:Sanjana
regno:2021ict112
age:24

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main() {
    char name[50];
    char regno[20];
    int age;

    // Taking input in the parent process
    printf("Enter Name: ");
    scanf("%s", name);
    printf("Enter Reg No: ");
    scanf("%s", regno);
    printf("Enter Age: ");
    scanf("%d", &age);

    pid_t pid = fork();  // Creating the child process

    if (pid < 0) {
        printf("Fork failed!\n");
        return 1;
    }
    else if (pid == 0) { // Child process
        printf("\nChild Process Output:\n");
        printf("Name: %s\n", name);
        printf("Reg No: %s\n", regno);
        printf("Age: %d\n", age);
    }
    else { // Parent process
        wait(NULL); // Wait for child to finish
        printf("\nParent Process Completed!\n");
    }

    return 0;
}


[2021ict112@fedora ~]$ gcc Ex02.c -o Ex02
[2021ict112@fedora ~]$ ./Ex02
Enter Name: Sanjana
Enter Reg No: 2021ICT112
Enter Age: 24

Child Process Output:
Name: Sanjana
Reg No: 2021ICT112
Age: 24

Parent Process Completed!


----------------------------------------------------------------------------------------------
(pipe method)

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

#define MSGSIZE 100  // Define message size

int main() {
    int p[2];  // Pipe file descriptors
    char buffer[MSGSIZE];  // Buffer to store received message
    pid_t pid;

    // Creating a pipe
    if (pipe(p) < 0) {
        perror("Pipe creation failed");
        exit(1);
    }

    pid = fork();  // Creating child process

    if (pid < 0) {
        perror("Fork failed");
        exit(1);
    }
    else if (pid > 0) { // Parent Process
        close(p[0]); // Close reading end of the pipe

        // Taking user input
        char name[50], regno[20], age[10];
        printf("Enter Name: ");
        scanf("%s", name);
        printf("Enter Reg No: ");
        scanf("%s", regno);
        printf("Enter Age: ");
        scanf("%s", age);

        // Formatting message and writing to pipe
        snprintf(buffer, MSGSIZE, "Name: %s\nReg No: %s\nAge: %s", name, regno, age);
        write(p[1], buffer, strlen(buffer) + 1);  // Sending formatted message to child
        
        close(p[1]); // Close writing end of the pipe
    }
    else { // Child Process
        close(p[1]); // Close writing end of the pipe

        // Reading data from parent
        read(p[0], buffer, MSGSIZE);
        printf("\nChild Process Output:\n%s\n", buffer);

        close(p[0]); // Close reading end of the pipe
    }

    return 0;
}


[2021ict112@fedora ~]$ touch pipe.c
[2021ict112@fedora ~]$ vi pipe.c
[2021ict112@fedora ~]$ gcc pipe.c -o pipe
[2021ict112@fedora ~]$ ./pipe
Enter Name: Sanjana
Enter Reg No: 2021ict112
Enter Age: 24

Child Process Output:
Name: Sanjana
Reg No: 2021ict112
Age: 24



===================================================================================================================================================
(Home Work)

 step01: parent process get input from user
 step02: sending these inputs to child process
 step03: child process getting these inputs from parent and doing calculation
 step04: step the calculated values to parent
 step05: parent print the outputs
 
 [circle,rectangle,triangle,square]
 
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

void calculate_area(char shape, double a, double b, double *area) {
    switch (shape) {
        case 'C': // Circle
            *area = 3.14159 * a * a;
            break;
        case 'T': // Triangle
            *area = 0.5 * a * b;
            break;
        case 'S': // Square
            *area = a * a;
            break;
        case 'R': // Rectangle
            *area = a * b;
            break;
        default:
            *area = -1; // Invalid shape
    }
}

int main() {
    int pipe1[2]; // Parent to Child
    int pipe2[2]; // Child to Parent

    if (pipe(pipe1) == -1 || pipe(pipe2) == -1) {
        perror("Pipe creation failed");
        return 1;
    }

    pid_t pid = fork();

    if (pid < 0) {
        perror("Fork failed");
        return 1;
    }

    if (pid > 0) { // Parent Process
        close(pipe1[0]); // Close read end of pipe1
        close(pipe2[1]); // Close write end of pipe2

        char shape;
        double a, b = 0, area;

        // Step 1: Get input from user
        printf("Enter shape (C: Circle, T: Triangle, S: Square, R: Rectangle): ");
        scanf(" %c", &shape);
        printf("Enter dimensions: ");
        if (shape == 'C' || shape == 'S')
            scanf("%lf", &a);
        else
            scanf("%lf %lf", &a, &b);

        // Step 2: Send inputs to child process
        write(pipe1[1], &shape, sizeof(shape));
        write(pipe1[1], &a, sizeof(a));
        write(pipe1[1], &b, sizeof(b));
        close(pipe1[1]); // Done writing

        // Step 3: Wait and read result from child
        wait(NULL); // Wait for child to finish
        read(pipe2[0], &area, sizeof(area));
        close(pipe2[0]);

        // Step 4: Print result
        if (area >= 0)
            printf("Calculated Area: %.2f\n", area);
        else
            printf("Invalid shape!\n");
    } else { // Child Process
        close(pipe1[1]); // Close write end of pipe1
        close(pipe2[0]); // Close read end of pipe2

        char shape;
        double a, b, area;

        // Step 1: Read inputs from parent
        read(pipe1[0], &shape, sizeof(shape));
        read(pipe1[0], &a, sizeof(a));
        read(pipe1[0], &b, sizeof(b));
        close(pipe1[0]);

        // Step 2: Calculate area
        calculate_area(shape, a, b, &area);

        // Step 3: Send result back to parent
        write(pipe2[1], &area, sizeof(area));
        close(pipe2[1]);

        _exit(0);
    }

    return 0;
}


[2021ict112@fedora ~]$ vi homework.c
[2021ict112@fedora ~]$ gcc homework.c -o homework
[2021ict112@fedora ~]$ ./homework
Enter shape (C: Circle, T: Triangle, S: Square, R: Rectangle): C
Enter dimensions: 7
Calculated Area: 153.94
[2021ict112@fedora ~]$ ./homework
Enter shape (C: Circle, T: Triangle, S: Square, R: Rectangle): T
Enter dimensions: 5
7
Calculated Area: 17.50
[2021ict112@fedora ~]$ ./homework
Enter shape (C: Circle, T: Triangle, S: Square, R: Rectangle): S
Enter dimensions: 2
Calculated Area: 4.00
[2021ict112@fedora ~]$ ./homework
Enter shape (C: Circle, T: Triangle, S: Square, R: Rectangle): R
Enter dimensions: 20
15
Calculated Area: 300.00
