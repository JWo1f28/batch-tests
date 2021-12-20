@echo off

::Create Log
del log.txt 2>nul
copy nul log.txt 1>nul
echo LOG START > log.txt

::Menu
:menu
echo :menu load start >> log.txt
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
echo  [5] -
echo  [6] Clear Cached Data
echo.
echo  [Q] Exit

::Make Selection and apply it to %selection%
set /p _selection=
echo _selection change to %_selection% >> log.txt

::Goto Each Function Accordingly
if %_selection%==1 (
    echo call netscan.bat start >> log.txt
    rem Netscan
    call netscan.bat
) else if %_selection%==2 (
    echo call portscan.bat start >> log.txt
    rem Portscan
    call portscan.bat
) else if %_selection%==3 (
    echo call pwget.bat start >> log.txt
    rem Password Get
    call pwget.bat
) else if %_selection%==4 (
    goto menu
) else if %_selection%==5 (
    goto menu
) else if %_selection%==6 (
    echo call cleanup.bat start>> log.txt
    rem cache clearing
    call cleanup.bat
    goto menu
) else if %_selection%==Q (
    echo exit batch menu.bat >> log.txt
    exit /B
) else if %_selection%==q (
    echo exit batch menu.bat >> log.txt
    exit /B
) else (
    echo exception: return to :menu start >> log.txt
    goto menu
)

echo LOG_ESCP ERR, return to :menu start >> log.txt
goto menu