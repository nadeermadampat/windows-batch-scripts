@echo off
TITLE LIST AND KILL TASKS BY PORT ~ FHD
COLOR 3F 
echo %Date:~10,4% (c) FHD - nadeermadampat@gmail.com
echo. & echo.
SET "tab=	"
:askPort
SET /p "port=Enter the port you need to trace : "
echo. 
echo -------------------------------------
echo Proto%tab% Local Addr%tab%%tab%Foriegn Addr%tab%%tab%State%tab%%tab%TASK ID 
netstat -a -n -o |findstr :%port%
echo. & echo. 
echo OPTIONS
echo -------
echo 1) x to exit
echo 2) c to enter and find another port
echo 3) Enter the TASK ID you want to kill
echo.
SET /p "killConfirm= Your Choice : "
IF %killConfirm%==x exit
IF %killConfirm%==c goto :askPort
TASKKILL  /PID %killConfirm% /T /F
goto :askPort
pause