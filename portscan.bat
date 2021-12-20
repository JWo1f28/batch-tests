@echo off
echo portscan-2: Portscan Loaded >> log.txt

::Portscan Function
cls
setlocal enableextensions enabledelayedexpansion

::Variables
set _counter=0
set _checkcounter=0
echo portscan-11: Vars Created >> log.txt

echo -- PORTSCAN --
echo This Function requires the previous
echo use of NetScan (ID:1) to function
echo.
echo This function may result in drops in
echo performance depending on the devices
echo in your "ipadr.txt" file. This lists
echo all IPs on your network after completing
echo the "Netscan" function
echo portscan-22: UI Printed >> log.txt
pause

::Files
del checks.txt 2>>log.txt
del ports.txt 2>>log.txt
copy nul checks.txt 1>>log.txt
copy nul ports.txt 1>>log.txt
echo portscan-30: Checks and Ports Refreshed >> log.txt

::Clear and Start Scan
cls
echo SCAN STARTING, PLEASE DO NOT
echo CLOSE CMD WINDOWS THAT OPEN

echo portscan-37: Start one(1) scansub batch per item in ipadr.txt >> log.txt
For /F "skip=1 tokens=1 delims= " %%a in (ipadr.txt) DO (
    start /min scansub.bat %%a
    set /a _counter+=1
    echo portscan-41: Scansub started for %%a >> log.txt
)

cls
echo SCANS COMPLETED:
echo.

echo portscan-48: Start Checking Loop >> log.txt
:checks
set _checkcounter=0
for /F %%b in (checks.txt) DO (
    set /a _checkcounter+=1
    echo portscan-53: Checking Escape Requirement Set >> log.txt
)
if !_checkcounter! == %_counter% (
    goto checkcomplete
    echo portscan-57: Break Loop >> log.txt
)
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
for /f %%a in ('"prompt $H&for %%b in (0) do rem"') do set "BS=%%a"
<nul set /p"=!BS!!CR!!_checkcounter! / %_counter% COMPLETE"
echo portscan-62: Update Counter >> log.txt
goto checks

:checkcomplete
cls
echo SCAN COMPLETE
echo.
echo THE FOLLOWING PORTS ARE OPEN
echo portscan-70: Scan Concluded, Display Open Ports >> log.txt
for /F "tokens=*" %%c in (ports.txt) DO (
    echo %%c
)
echo portscan-74: Open Ports Printed >> log.txt

pause
endlocal
echo portscan-78: Return to Menu >> log.txt
exit /B