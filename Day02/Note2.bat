:: turn off command echoing to prevent displaying commands as they execute
@echo off

::Extracts 2 characters starting from position 4 in the system date and stores it in the variable Month(the month part).
set/a Month=%date:~ 4,2%
::Displays the extracted month.
 echo your month is %Month%

::Extracts 2 characters starting from position 7.
set/a Day=%date:~ 7,2%
::Displays the extracted Day.
echo your Day is %Day%

::Extracts 2 characters starting from position 0.
set/p weekday=%date:~ 0,3%
::Displays the extracted Day name.
echo your day is %weekday%


::prevent the window closing immediately
pause
