@echo off
REM : Batch scrip to change windows IP address
REM Author : nadeermadampat@gmail.com
REM 20/09/2015
set t=CHANGE IP ADDR
set sep=--------------------------
title %t%
cls && echo %t% && echo %sep% 
REM  /// SET IP CONF BELOW
set ip=10.66.228.154
set subnet=255.255.254.0
set gateway=10.66.228.1
set interface=Ethernet
netsh int ip set address "%interface%" static  %ip% %subnet% %gateway% 1
netsh interface show interface
ipconfig /flushdns
pause && netsh interface ip show addresses "%interface%" && pause