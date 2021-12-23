@echo off

::Prereq
setlocal enabledelayedexpansion
cls

::Vars
Set _counter=0
set _domain=192.168

::Refresh ipadr.txt
del ipadr.txt 2>nul
copy nul ipadr.txt 1>nul

::UI
echo --ONLINE IPv4 DEVICES-- >> ipadr.txt
echo STARTING IPv4 NETWORK PROBE, THIS WILL TAKE A WHILE

::Net Probe
for /L %%a IN (0,1,255) DO (
    for /L %%b IN (0,1,255) DO (
        set _toping=%_domain%.%%a.%%b
        ping -n 1 !_toping! | find "TTL" >nul
        if not errorlevel 1 (
            nslookup !_toping! 2>&1 | find "Name" >nul
            if errorlevel 1 (
                set _iptag=NO DOMAIN
            ) else (
                for /F "tokens=2 delims= " %%c in ('nslookup !_toping! ^| find "Name"') do (
                    set _iptag=%%c
                )
            )
            echo !_toping! - !_iptag! >> ipadr.txt
        )
        set /a _counter+=1
        for /f %%f in ('copy /Z "%~dpf0" nul') do set "CR=%%f"
        for /f %%f in ('"prompt $H&for %%g in (0) do rem"') do set "BS=%%f"
        <nul set /p"=!BS!!CR!!_counter!/65536 TESTED"
    )
)

::Output
cls
echo SCAN COMPLETE, CONTINUE TO RETURN TO THE MENU

pause
endlocal
exit /B