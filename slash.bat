@echo off
chcp 65001 > nul
setlocal enabledelayedexpansion
title slashOSS
mode con cols=80 lines=30

:cmd
set /p "type= [7m{살해자}:[0m"

%type%

if "%type%" EQU "ls" ( dir )
if "%type%" EQU "ls -d" ( dir | find "<DIR>" )
if "%type%" EQU "ls -exe" ( dir | find ".exe" )
if "%type%" EQU "ls -d -exe" ( goto secondoption )
if "%type%" EQU "pwd" ( goto pwd )
if "%type%" EQU "clear" ( cls )
if "%type%" EQU "ifconfig" ( ipconfig | find "IPv4" )
if "%type%" EQU "bruteforce" ( goto bruteforce )
if "%type%" EQU "passwd" ( goto passwd )
if "%type%" EQU "neofetch" ( goto neofetching )
if "%type%" EQU "pacman" ( goto error )
if "%type%" EQU "pacman nmap -y" ( goto nmap-install )  
if "%type%" EQU "create wordlist" ( goto createw )
if "%type%" EQU "pacman msfconsole -y" ( goto metasploit-install )
if "%type%" EQU "pacman notpadpp -y" ( goto notpadpp-install )
if "%type%" EQU "pacman python3 -y" ( goto python3-install )  
if "%type%" EQU "pacman hydra -y" ( goto hydra-install )
if "%type%" EQU "h" ( goto commandlist )
if "%type%" EQU "xterm" ( goto xterminal )
if "%type%" EQU "back" ( cd .. )
if "%type%" EQU "pacman winhack -y" ( goto winhack-install ) 
if "%type%" EQU "winhack" ( winhack.bat )
if "%type%" EQU "xrdp" ( goto xrdp )
if "%type%" EQU "msfconsole" ( goto msfconsole )
if "%type%" EQU "hydra" ( goto hydra )
if "%type%" EQU "nc" ( goto nc-listener )
if "%type%" EQU "exploiter" ( goto exploiter )
if "%type%" EQU "pacman putty -y" ( goto putty-install )

goto cmd



:pwd
echo current path:
cd
goto cmd


:neofetching
cls
echo       ^|^ 
echo #=====^|^#================\
echo #=====^|^#================/
echo       ^|^


systeminfo | find "Host Name"
systeminfo | find "[01]"
systeminfo | find "[02]"

pause > nul
goto cmd


:bruteforce
cls
set /p hostname="hostname>"
set /p username="username>"
set /p wordlist="wordlist>"

set /a count=1
for /f %%a in ( %wordlist% ) do (
set passwd=%%a
call :attempt
) 

:attempt
net use \\%hostname% /user:%username% %passwd% >nul 2>&1
echo ([32m%count%[0m)password:[32m%passwd%[0m
set /a count=%count%+1
goto cmd


:error
cls 
echo u have missed a argument
echo example:  pacman <name> -y 
goto cmd


:nmap-install
curl https://nmap.org/dist/nmap-7.95-setup.exe -o nmap-7.95-setup.exe.exe 
nmap-7.95-setup.exe 
goto cmd


:createw
for /L %%a in (1000,1,9999) do (

echo creation wordlist...
echo %%a >> word.txt
)
goto cmd


:metasploit-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://downloads.metasploit.com/data/releases/metasploit-latest-windows-x64-installer.exe -o msfconsole-installer.exe
msfconsole-installer.exe
goto cmd


:notpadpp-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://github.com/notepad-plus-plus/notepad-plus-plus/releases/download/v8.7.1/npp.8.7.1.Installer.x64.exe -o notpadpp.exe
notpadpp.exe
goto cmd


:hydra-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl -L -o hydra.zip https://github.com/maaaaz/thc-hydra-windows/archive/master.zip
tar -xf hydra.zip
goto cmd


:python3-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl https://www.python.org/ftp/python/3.13.0/python-3.13.0-amd64.exe -o python-3.13.0-amd64.exe
python-3.13.0-amd64.exe
goto cmd

:putty-install
curl https://the.earth.li/~sgtatham/putty/latest/wa64/putty.exe 
putty.exe
goto cmd


:secondoption
dir | find "<DIR>" 
dir | find ".exe" 
goto cmd



:commandlist
echo ls
echo clear
echo pwd 
echo ifconfig
echo pacman
echo neofetch
echo create wordlist
echo bruteforce
echo passwd
echo msfconsole
echo hydra
echo nc
echo winhack
echo exploiter
goto cmd


:passwd
set /p username="username>"
cls
set /p password="new password>"
net user %username% %password% > nul
echo password changed with successfull!
goto cmd


:xterminal
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; $mainForm = New-Object System.Windows.Forms.Form; $mainForm.Text = 'slashOSS'; $lbl = New-Object System.Windows.Forms.Label; $lbl2 = New-Object System.Windows.Forms.Label; $lbl.Text = 'Hello World\n'; $lbl2.Text = 'Hello World\n'; $mainForm.Controls.Add($lbl); $mainForm.Controls.Add($lbl2); $mainForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen; $mainForm.ShowDialog()}"
goto cmd



:winhack-install
cls
echo      ########
echo     ##########
echo     ###
echo     ##########
echo      #######
echo     download...
curl -L https://github.com/SL4Y3RO4/winhack/blob/main/winhack.bat -o winhack.bat
goto cmd


:msfconsole
cd C:\metasploit
console.bat
goto main


:hydra
cd thc-hydra-windows-master

set /p username="username>"
set /p hostname="hostname>"
set /p wordlist="wordlist>"
set /p wordlist="protocol>"

hydra -l %username% -P %wordlist% %hostname% %protocol%  
goto main


:nc-listener
cls
cd C:\Program Files (x86)\Nmap
ncat -lvp %RANDOM%
goto main


:exploiter
set /p "command= [7m{살해자/exploiter}0══|#000000>[0m"

%command%

if "%command%" EQU "bye" ( goto cmd )
if "%command%" EQU "ls" ( dir )
if "%command%" EQU "clear" ( cls )

goto exploiter