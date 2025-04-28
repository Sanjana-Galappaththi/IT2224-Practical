::We can display this sentence using echo command 
{ ~ }  » echo "Who are You ?"
::output =>
Who are You ?

::We can store the Data using read command
{ ~ }  » read name
::output=>
sanjana

::We can display this sentence using echo command 
{ ~ }  » echo "Enter Number 1"
::output =>
Enter Number 1

::We can store the Data using read command
{ ~ }  » read x
::output=>
10
{ ~ }  » echo "Enter Number 2"
Enter Number 2

::We can store the Data using read command
{ ~ }  » read y
::output=>
25
{ ~ }  » echo "Enter Number 3"
Enter Number 3
::We can store the Data using read command
{ ~ }  » read z
::output=>
30

::We can get the summation of the previous nummbers(x,y,z)
{ ~ }  » sum=$(($x+$y+$z))
{ ~ }  » echo "Summation" $sum
::output=>
Summation 65

::We can get the Average of the previous nummbers(x,y,z)
{ ~ }  » avg=$(($sum/3))
{ ~ }  » echo "Average" $avg
::output=>
Average 21

::We can get the previous name 
{ ~ }  » echo "Hi..." $name
::output=>
Hi... sanjana


::Exersice: Read two numbers from user and print
::addition, multiplication, substraction  and division 

::We can display this sentence using echo command 
{ ~ }  » echo "Enter number 1"
Enter number 1
::We can store the Data using read command
{ ~ }  » read p
::Now we can enter a number
15

::We can display this sentence using echo command 
{ ~ }  » echo "Enter number 2"
Enter number 2
::We can store the Data using read command
{ ~ }  » read q
::Now we can enter a number
35

::We can get the summation of the previous nummbers(p,q)
{ ~ }  » add=$(($p+$q))
{ ~ }  » echo  "Addition is :" $add
Addition is : 50

::We can get the multiplicaion of the previous nummbers(p,q)
{ ~ }  » mul=$(($p*$q))
{ ~ }  » echo "multiplication is :" $mul
multiplication is : 525

::We can get the multiplicaion of the previous nummbers(p,q)
{ ~ }  » sub=$(($p-$q))
{ ~ }  » echo "Substration is :" $sub
Substration is : -20

::We can get the multiplicaion of the previous nummbers(p,q)
{ ~ }  » div=$(($p/$q))
{ ~ }  » echo "division is :" $div
division is : 0

::day of the month (If today's date is March 30, 2025)
{ ~ }  » date +%d
30

::that gives you the short date format: MM/DD/YY
::(If the current date is March 30, 2025, the output will be:03/30/25)
{ ~ }  » date +%D
03/30/25

::that gives you the Weekday short name
{ ~ }  » date +%a
Sun

::that gives you the Weekday full name
{ ~ }  » date +%A
Sunday

::To display the hour in 24-hour format
{ ~ }  » date +%H
13

::To display the current minute 
{ ~ }  » date +%M
13

::cal command is used to display a calendar in the terminal.
{ ~ }  » cal
     March 2025
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31

::used to display the current time in the 24-hour format
{ ~ }  » date +%T
13:14:04

::used to represent the month in a 2-digit format
{ ~ }  » date +%m
03

::used to display the abbreviated month name (3-letter abbreviation)
{ ~ }  » date +%h
Mar
::used to represent the seconds in the current time, in two-digit format
{ ~ }  » date +%S
47

::used to display the number of seconds since the Unix Epoch
{ ~ }  » date +%s
1743320700

::we can enter the data inside the folder using vi command
:: .sh => Shell script
{ ~ }  » vi prgrml.sh
{ ~ }  » ls
abc.tsv  bin  prgrml.sh


{ ~ }  » chmod 777 prgrml.sh
::chmod - Command to change file permissions.
:: Permission code:
  ::7 = read + write + execute (owner)
  ::5 = read + execute (group)
  ::7 = read + write + execute (others)
{ ~ }  » ls
abc.tsv  bin  prgrml.sh

::we can get the outputs  inside the prgrml.sh folder
{ ~ }  » ./prgrml.sh
Who are you?
sanjana
Hi sanjana
