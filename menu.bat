@echo off
setlocal

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
echo  [4] Proto Fast NScan
echo  [5] Run Updater
echo  [6] Clear Cached Data
echo.
echo  [Q] Exit
echo.
set /p _selection=

::Selection Logic
if %_selection%==1 (
    rem netscan
    call netscan.bat
) else if %_selection%==2 (
    rem portscan
    call portscan.bat
) else if %_selection%==3 (
    rem password get
    call pwget.bat
) else if %_selection%==4 (
    rem proto netscan
    call fnscan.bat
) else if %_selection%==5 (
    rem updater
    call update.bat
) else if %_selection%==6 (
    rem cleanup
    call cleanup.bat
) else if %_selection%==Q (
    rem exit
    exit
) else if %_selection%==q (
    rem exit
    exit
) else (
    rem return to menu
    goto menu
)
goto menu

endlocal
exit