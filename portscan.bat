@echo off

::Portscan Function
cls
setlocal enableextensions enabledelayedexpansion

::Variables
set _counter=0
set _checkcounter=0

echo -- PORTSCAN --
echo This Function requires the previous
echo use of NetScan (ID:1) to function
echo.
echo This function may result in drops in
echo performance depending on the devices
echo in your "ipadr.txt" file. This lists
echo all IPs on your network after completing
echo the "Netscan" function
pause

::Files
del checks.txt 2>nul
del ports.txt 2>nul
copy nul checks.txt 1>nul
copy nul ports.txt 1>nul

::Clear and Start Scan
cls
echo SCAN STARTING, PLEASE DO NOT
echo CLOSE CMD WINDOWS THAT OPEN

For /F "skip=1 tokens=1 delims= " %%a in (ipadr.txt) DO (
    start /min scansub.bat %%a
    set /a _counter+=1
)

cls
echo SCANS COMPLETED:
echo.

:checks
set _checkcounter=0
for /F %%b in (checks.txt) DO (
    set /a _checkcounter+=1
)
if !_checkcounter! == %_counter% (
    goto checkcomplete
)
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
for /f %%a in ('"prompt $H&for %%b in (0) do rem"') do set "BS=%%a"
<nul set /p"=!BS!!CR!!_checkcounter! / %_counter% COMPLETE"
goto checks

:checkcomplete
cls
echo SCAN COMPLETE
echo.
echo THE FOLLOWING PORTS ARE OPEN
for /F "tokens=*" %%c in (ports.txt) DO (
    echo %%c
)

pause
endlocal
exit /B