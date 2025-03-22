:: turn off command echoing to prevent displaying commands as they execute
@echo off
:: display the current logged-in user's username
echo username: %username%   

:: display the Operating system version 
echo window version: %version%
ver

:: change the color of cmd
color b

::display or can change system time
echo Day : %date%

::get user input and store it a variable
set Age\p = How old are you

::Shows or sets the system date
date

::Shows or sets the system time 
time

::prevent the window closing immediately
pause