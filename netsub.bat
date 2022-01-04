@echo off
setlocal enabledelayedexpansion
::Netscan Slave Batch
set _toping=%1.%2
set _domname= 
copy nul %2.txt 1>nul
for /L %%a in (0,1,255) do (
    echo %_toping%.%%a
    ping -n 1 %_toping%.%%a | find "TTL" >nul
    if not errorlevel 1 (
        nslookup !_toping! 2>&1 | find "Name" >nul
        if errorlevel 1 (
            set _domname=NO DOMAIN
        ) else (
            for /F "tokens=2 delims= " %%b in ('nslookup !_toping! ^| find "Name"') do (
                set _domname=%%b
            )
        )
        echo %_toping%.%%a - !_domname! >> %2.txt
    )
)
echo DONE >> protonscan.txt
endlocal
exit