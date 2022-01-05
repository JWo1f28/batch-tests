@echo off

::THIS IS A PROTOTYPE FUNCTION
::
::THIS FUNCTION IS TO FUNCTION AS SUCH
::
::THE USER WILL BE OFFERED A CHOICE FOR EITHER FAST OR SLOW SCAN
::A SLOW SCAN IS THE CURRENT NETSCAN FUNCTION
::A FAST SCAN IS MEANT TO FUNCTION SIMILAR TO THE CURRENT PORTSCAN
::A DOMAIN WILL BE FOUND VIA IPCONFIG
::FOR EACH 3RD IP ADDRESS A SINGLE SLAVE BATCH WILL BE EXECUTED TO SCAN 256 ADDRESSES
::EACH BATCH WILL REPORT TO A UNIQUE TEXT FILE ITS STATUS
::THE MAIN BATCH WILL READ EACH ONE AND REPORT BACK TO THE USER

:scanmenu

::UI

cls
echo.
echo.
echo NETSCAN OPTIONS
echo.
echo [1] Slow Netscan
echo [2] Fast Netscan
echo.
echo.
echo [Q] Quit
echo.
set /p _nsselection=

::Logic

if %_nsselection%==1 (
    call netscan.bat
) else if %_nsselection%==2 (
    call protonetscan.bat
) else if %_nsselection%==Q (
    exit /B
) else if %_nsselection%==q (
    exit /B
)

goto scanmenu
exit /B