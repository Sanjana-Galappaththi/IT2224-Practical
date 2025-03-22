login as: 2021ict112
2021ict112@172.16.140.150's password:

1)  ls -lh
::Lists files in long format with human-readable sizes

2) touch abc.tsv
::we can Creates an empty file named abc.tsv

3) vi abc.tsv
::Opens abc.tsv in the vi text editor for editing.

4) head -2 abc.tsv
::Shows the first 2 lines of abc.tsv.
::output
::gg      45      56      78
::hh      25      15      15

5) cut -f1,3 abc.tsv
::Extracts fields 1 and 3 (tab-separated) from each line in abc.tsv
::output =>
::gg      56
::hh      15
::tt      2
::bb      02
::aa      11

6) tail -4 abc.tsv
:: Shows the last 4 lines of abc.tsv
::output =>
::hh      25      15      15
::tt      25      2       25
::bb      02      02      20
::aa      11      11      51

7) awk '{print}' abc.tsv
::Prints all lines of abc.tsv (same as cat abc.tsv).
::gg      45      56      78
::hh      25      15      15
::tt      25      2       25
::bb      02      02      20
::aa      11      11      51

8) head -n3 abc.tsv | tail -n1
::if we want to get only one row we can use this commands. above command shows the 3rd line of abc.tsv.
::output => tt      25      2       25

9) awk '{print $3}' abc.tsv
::Prints the 3rd column from each line of abc.tsv. if we want to print coloums we can use awk command.
::output =>
::56
::15
::2
::02
::11

10) wc -l abc.tsv
::Counts and displays the number of lines in abc.tsv.
::output =>5 abc.tsv

11) head -n5 abc.tsv | grep 'bb'
:: From the first 5 lines, shows lines that contain 'bb'
::output => bb      02      02      20

12) more abc.tsv
::using more command file content will be shown one page at a time

13) less abc.tsv
::using less command display the content and allowing you to scrooll both forward and backword

14) ls -ltr
ls -ltr | grep "abc.tsv"
::using this command list the files and directories with details
::l -used to long format(owner, size , modification time)
::t -used to sorts by modification time
::r -used to reverse the sorting order

15) ls -a 
ls -a | grep "abc.tsv"
::using this command list the files and directories including hidden files
::l -lists files in the current directory
::a -shows all files, including hidden files 

16) chmod 757 abc.tsv
::chmod - Command to change file permissions.
:: Permission code:
  ::7 = read + write + execute (owner)
  ::5 = read + execute (group)
  ::7 = read + write + execute (others)


Meaning: Set specific permissions on abc.tsv.


17) find . -name "*.txt"
::find - Command to search for files and directories.
:: .   -Search in the current directory (and subdirectories).

18) cut -d ',' -f 1,3 xyz.tsv > xyz1.tsv
::Extract columns 1 and 3 from xyz.tsv and save to xyz1.tsv.
::cut - Command to extract fields/columns from a file.
::-d ','*: Set delimiter as comma.
::-f 1,3*: Extract fields 1 and 3.




