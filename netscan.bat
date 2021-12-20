@echo off
echo call netscan.bat end>> log.txt

::NETSCAN FUNCTION
cls
setlocal enabledelayedexpansion

::Variables
echo counter variable set >> log.txt
Set _counter=0
set _domain=192.168

::Refresh ipadr.txt
echo refresh ipadr.txt >> log.txt
del ipadr.txt 2>nul
copy nul ipadr.txt 1>nul
echo --ONLINE IPv4 DEVICES-- >> ipadr.txt

::Network Probe
echo start net probe >> log.txt
echo STARTING IPv4 NETWORK PROBE, THIS WILL TAKE A WHILE
::Scan all Local IPs
for /L %%a IN (0,1,255) DO (
    for /L %%b IN (0,1,255) DO (
        echo testing %_domain%.%%a.%%b >> log.txt
        set _toping=%_domain%.%%a.%%b
        ping -n 1 !_toping! | find "TTL" >nul
        if not errorlevel 1 (
            echo ipadr online, starting nslookup >> log.txt
            nslookup !_toping! 2>&1 | find "Name" >nul
            if errorlevel 1 (
                set _iptag=NO DOMAIN
            ) else (
                for /F "tokens=2 delims= " %%c in ('nslookup !_toping! ^| find "Name"') do (
                    set _iptag=%%c
                )
            )
            echo send nslookup domain name to ipadr.txt >> log.txt
            echo !_toping! - !_iptag! >> ipadr.txt
        )
        Rem Progress
        echo user feedback start >> log.txt
        set /a _counter+=1
        for /f %%f in ('copy /Z "%~dpf0" nul') do set "CR=%%f"
        for /f %%f in ('"prompt $H&for %%g in (0) do rem"') do set "BS=%%f"
        <nul set /p"=!BS!!CR!!_counter!/65536 TESTED"
    )
) 
   

cls
echo netscan complete, return to menu>> log.txt
echo SCAN COMPLETE, CONTINUE TO RETURN TO THE MENU

pause
endlocal
exit /B