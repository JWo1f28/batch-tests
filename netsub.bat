@echo off
setlocal enabledelayedexpansion
::Netscan Slave Batch
set _toping=%1.%2
set _domname= 
for /L %%a in (0,1,255) do (
    echo %_toping%.%%a
    ping -n 1 %_toping%.%%a | find "TTL" >nul
    if not errorlevel 1 (
        echo %_toping%.%%a >> %2.txt
    )
)
echo DONE >> status%2.txt
endlocal
exit