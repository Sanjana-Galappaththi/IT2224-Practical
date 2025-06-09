# MATLAB Code Repository

This repository contains various MATLAB scripts demonstrating basic mathematical operations, matrix manipulations, and control structures such as loops and conditionals.

## Requirements
- MATLAB application is required to run these scripts.

## Included MATLAB Scripts

### 1. Basic Arithmetic Operations
```matlab
% Define variables
a = 5;
b = 10;

% Addition
c = a + b;
% Multiplication
d = a * b;
% Division
e = a / b;
% Subtraction
f = a - b;
```
**Output:**
```
c = 15
d = 50
e = 0.5000
f = -5
```

### 2. Matrix Creation and Operations
```matlab
% Define Matrices
A = [1 2 3];
B = [4;5;6];
C = [2 3 4;5 6 7;8 9 10];

% Size of matrix
size_C = size(C);
% Sum of matrix elements
sum_C = sum(sum(C));
% Column-wise and row-wise sums
col_sum = sum(C,1);
row_sum = sum(C,2);
```
**Output:**
```
size_C = [3 3]
sum_C = 54
col_sum = [15 18 21]
row_sum = [9; 18; 27]
```

### 3. Finding Min and Max Elements
```matlab
% Column-wise minimum
min_col = min(C);
% Minimum of whole matrix
min_all = min(min(C));
% Column-wise maximum
max_col = max(C);
% Maximum of whole matrix
max_all = max(max(C));
```
**Output:**
```
min_col = [2 3 4]
min_all = 2
max_col = [8 9 10]
max_all = 10
```

### 4. Accessing Matrix Elements
```matlab
% Accessing specific elements
second_element = C(2);
first_row = C(1,:);
first_column = C(:,1);
last_element_first_row = C(1,end);
```
**Output:**
```
second_element = 5
first_row = [2 3 4]
first_column = [2; 5; 8]
last_element_first_row = 4
```

### 5. Matrix Addition, Subtraction, and Multiplication
```matlab
A = [1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16];
B = A; % Duplicate matrix

% Element-wise Addition and Subtraction
sum_matrix = A + B;
diff_matrix = A - B;

% Matrix Multiplication
prod_matrix = A * B;
```
**Output:**
```
sum_matrix =
  2  4  6  8
 10 12 14 16
 18 20 22 24
 26 28 30 32

diff_matrix =
  0  0  0  0
  0  0  0  0
  0  0  0  0
  0  0  0  0

prod_matrix =
  90  100  110  120
 202  228  254  280
 314  356  398  440
 426  484  542  600
```

### 6. Conditional Statements
```matlab
num = 4;
if num > 0
    disp('The Number Is Positive')
else
    disp('The Number Is Negative')
end
```
**Output:**
```
The Number Is Positive
```

### 7. Checking Odd or Even Number
```matlab
if mod(num,2) == 0
    disp('The Number Is Even')
else
    disp('The Number Is Odd')
end
```
**Output:**
```
The Number Is Even
```

### 8. While Loop: Printing Numbers 1 to 5
```matlab
a = 1;
while a <= 5
    disp (a)
    a = a + 1;
end
```
**Output:**
```
1
2
3
4
5
```

## How to Run the Scripts
1. Open MATLAB.
2. Copy and paste the desired script into the MATLAB command window or save it as a `.m` file and run it.
3. Observe the output in the command window.

## Conclusion
These MATLAB scripts demonstrate fundamental concepts such as arithmetic operations, matrix manipulation, conditional statements, and loops. They serve as an excellent introduction to MATLAB programming.


