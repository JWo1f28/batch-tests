@echo off

::Delete Replace.bat after updates
del replace.bat 2>nul

::Menu Loop
:menu
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
set /p _selection=

::Selection Logic
if %_selection%==1 (
    call netscan.bat
) else if %_selection%==2 (
    call portscan.bat
) else if %_selection%==3 (
    call pwget.bat
) else if %_selection%==4 (
    goto menu
) else if %_selection%==5 (
    call update.bat
) else if %_selection%==6 (
    call cleanup.bat
) else if %_selection%==Q (
    exit
) else if %_selection%==q (
    exit
) else (
    goto menu
)
goto menu