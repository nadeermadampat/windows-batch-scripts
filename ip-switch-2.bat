@echo off 
echo 2014 (c) nadeermadampat@gmail.com
echo. && echo.
echo WINDOWS FAST IP-SWITCHER
echo ------------------------ && echo.
echo What you want:
echo [A] Set Static IP
echo [B] Set DHCP && echo.
:choice
SET /P C=[A,B]?
for %%? in (A) do if /I "%C%"=="%%?" goto A
for %%? in (B) do if /I "%C%"=="%%?" goto B
goto choice
:A
echo "Enter Static IP Address Information"
echo "Static IP Address:"
set /p IP_Addr=
echo "Default Gateway:"
set /p D_Gate=
echo "Subnet Mask:"
set /p Sub_Mask=
echo "Setting Static IP Information"
netsh interface ip set address "LAN" static %IP_Addr% %Sub_Mask% %D_Gate% 1
netsh int ip show config
pause && goto end
:B
ECHO Resetting IP Address and Subnet Mask For DHCP
netsh int ip set address name = "LAN" source = dhcp
ipconfig /renew
ECHO Here are the new settings for %computername%:
netsh int ip show config
:end
pause