@ECHO OFF

setlocal EnableDelayedExpansion
set LF=^


ECHO Written by Harrison Coale 6/23/2016. Automates basic every day tasks during bootup.!LF!

set /P M="Good Morning. Would you like me to load your things? 1(everything), 2(email), 3(web), or N(quit).!LF!"
IF %M%==1 GOTO ALL
IF %M%==2 GOTO OUTLOOK
IF %M%==3 GOTO CHROME
IF %M%==N GOTO ENDOP

:ALL
ECHO Let's get started.
PAUSE
start C:\"Program Files"\"Microsoft Office 15"\root\office15\OUTLOOK.EXE
start C:\"Program Files (x86)"\Google\Chrome\Application\chrome.exe
start %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe
start C:\"Program Files"\"Microsoft Office 15"\root\office15\lync.exe
start C:\"Program Files"\"Microsoft Office 15"\root\office15\WINWORD.EXE
exit

:OUTLOOK
ECHO Retrieving your e-mail service.
PAUSE
start C:\"Program Files"\"Microsoft Office 15"\root\office15\OUTLOOK.EXE"
exit

:CHROME

ECHO Loading Chrome Web Browser.
PAUSE
start C:\"Program Files (x86)"\Google\Chrome\Application\chrome.exe
exit

:ENDOP

ECHO Cancelling all operations.
PAUSE
exit
