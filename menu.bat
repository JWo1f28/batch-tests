@echo off

::Create Log
del log.txt 2>nul
copy nul log.txt 1>nul

::Menu
:menu
echo menu-9 : Log Start >> log.txt
cls
echo.
echo.
echo  Select an option from the list below by pressing the
echo  corresponding number key on your keyboard followed
echo  by the Enter key:
echo.
echo.
echo  [1] Run Network Scan
echo  [2] Run Portscan
echo  [3] Obtain Current Network Password
echo  [4] -
echo  [5] Run Updater
echo  [6] Clear Cached Data
echo.
echo  [Q] Exit
echo menu-26: Menu Loaded >> log.txt

::Make Selection and apply it to %selection%
set /p _selection=
echo menu-30: Selection Made >> log.txt

::Goto Each Function Accordingly
if %_selection%==1 (
    rem Netscan
    echo menu-35: Call Netscan >> log.txt
    call netscan.bat
) else if %_selection%==2 (
    rem Portscan
    echo menu-39: Call Portscan >> log.txt
    call portscan.bat
) else if %_selection%==3 (
    rem Password Get
    echo menu-43: Call PwGet >> log.txt
    call pwget.bat
) else if %_selection%==4 (
    goto menu
) else if %_selection%==5 (
    rem Updater
    call update.bat
    goto menu
) else if %_selection%==6 (
    rem cache clearing
    call cleanup.bat
    goto menu
) else if %_selection%==Q (
    exit
) else if %_selection%==q (
    exit
) else (
    goto menu
)

goto menu