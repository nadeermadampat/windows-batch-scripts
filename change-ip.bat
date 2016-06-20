@echo off
REM : Batch scrip to change windows IP address
REM Author : nadeermadampat@gmail.com
REM 20/09/2015
set t=CHANGE IP ADDR
set sep=--------------------------
title %t%
:conf
cls && echo %t% && echo %sep% 
REM  /// SET IP CONF BELOW
set /p ip="Enter new IP : " 
set /p subnet="Enter Subnet : "
set /p gateway="Enter Gateway : "
set /p interface="Enter Adapter Name : "
echo %sep%
echo CONFIRM CONF :
echo IP: %ip% && echo Subnet: %subnet%
echo Gateway: %gateway% && echo Adapter Name: %interface%
SET /P cnf=Continue with changes (X to exit or Y/[N]) ?
IF /I %cnf% NEQ Y IF /I %cnf% NEQ X GOTO conf
IF /I %cnf% == X GOTO end
netsh int ip set address "%interface%" static  %ip% %subnet% %gateway% 1
netsh interface show interface
ipconfig /flushdns

SET /P cnf=Show IPCONFIG Data (X to exit or Y to Show ) ?
IF /I %cnf% NEQ Y goto end
IF /I %cnf% EQU Y GOTO ifconfig
:ifconfig
netsh interface ip show addresses "%interface%"
:end
pause