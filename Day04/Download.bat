@echo off
::echo listing files older than 30 days in Downloads...
forfiles /p "%USERPROFILE%\Downloads" /s /m *.* /d -30
::echo Saving summery to Download_Summary.txt...
forfiles /p "%USERPROFILE%\Downloads" /s /m *.* /d -30 > "%USERPROFILE%\Downloads\Download_Summary.txt"
echo Summary saved successfully!
pause

