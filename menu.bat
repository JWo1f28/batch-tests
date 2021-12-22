@echo off
del log.txt 2>nul
copy nul log.txt 1>nul
del replace.bat 2>nul
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
set /p _selection=
echo menu-30: Selection Made >> log.txt
if %_selection%==1 (
    echo menu-35: Call Netscan >> log.txt
    call netscan.bat
) else if %_selection%==2 (
    echo menu-39: Call Portscan >> log.txt
    call portscan.bat
) else if %_selection%==3 (
    echo menu-43: Call PwGet >> log.txt
    call pwget.bat
) else if %_selection%==4 (
    goto menu
) else if %_selection%==5 (
    call update.bat
    goto menu
) else if %_selection%==6 (
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