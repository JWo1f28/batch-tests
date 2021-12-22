@echo off
echo netscan-2: Netscan Loaded >> log.txt
cls
setlocal enabledelayedexpansion
Set _counter=0
set _domain=192.168
echo netscan-11: Vars Set >> log.txt
del ipadr.txt 2>>log.txt
copy nul ipadr.txt 1>>log.txt
echo --ONLINE IPv4 DEVICES-- >> ipadr.txt
echo netscan-17: ipadr.txt Created >> log.txt
echo STARTING IPv4 NETWORK PROBE, THIS WILL TAKE A WHILE
for /L %%a IN (0,1,255) DO (
    for /L %%b IN (0,1,255) DO (
        set _toping=%_domain%.%%a.%%b
        echo netscan-25: Ping %_domain%.%%a.%%b >> log.txt
        ping -n 1 !_toping! | find "TTL" >>log.txt
        if not errorlevel 1 (
            nslookup !_toping! 2>&1 | find "Name" >>log.txt
            if errorlevel 1 (
                set _iptag=NO DOMAIN
                echo netscan-31: No DNS Name Found >> log.txt
            ) else (
                for /F "tokens=2 delims= " %%c in ('nslookup !_toping! ^| find "Name"') do (
                    set _iptag=%%c
                    echo netscan-35: DNS Name Found: !_iptag! >> log.txt
                )
            )
            echo !_toping! - !_iptag! >> ipadr.txt
        )
        set /a _counter+=1
        for /f %%f in ('copy /Z "%~dpf0" nul') do set "CR=%%f"
        for /f %%f in ('"prompt $H&for %%g in (0) do rem"') do set "BS=%%f"
        <nul set /p"=!BS!!CR!!_counter!/65536 TESTED"
        echo netscan-45: Update Counter >> log.txt
    )
)
cls
echo SCAN COMPLETE, CONTINUE TO RETURN TO THE MENU
echo netscan-52: Netscan Complete >> log.txt
pause
endlocal
echo netscan-56: Return to Menu >> log.txt
exit /B