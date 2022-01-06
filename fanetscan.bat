@echo off
setlocal enabledelayedexpansion

::UI
cls
echo.
echo.
echo FAST NETSCAN
echo.

::Refresh domain.txt
del domain.txt 2>nul
copy nul domain.txt 1>nul
del ipadr.txt 2>nul
copy nul ipadr.txt 1>nul

::Vars
set _domain1=
set _domain2=
set _domain=
set _iptag=

::Find Domain
for /F "tokens=13 delims= " %%a in ('ipconfig ^| find "Default"') do (
    echo %%a > domain.txt
    for /F "tokens=1 delims=." %%b in (domain.txt) do (
        set _domain1=%%b
    )
    for /F "tokens=2 delims=." %%b in (domain.txt) do (
        set _domain2=%%b
    )
    set _domain=!_domain1!.!_domain2!
)

echo DOMAIN: %_domain%

::Start Slave Batches
echo.
echo.
echo STARTING SLAVE BATCHES

for /L %%a in (0,1,255) do (
    start /min netsub.bat %_domain% %%a
    copy nul %%a.txt 1>nul
    copy nul status%%a.txt 1>nul
)

::Checking Loop

:loopstart

set _checkcounter=0
for /L %%a in (0,1,255) do (
    for /F %%b in (status%%a.txt) do (
        if %%b == DONE (
            set /a _checkcounter+=1
        )
    )
)
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
for /f %%a in ('"prompt $H&for %%b in (0) do rem"') do set "BS=%%a"
<nul set /p"=!BS!!CR!!_checkcounter! / 256 COMPLETE"

if !_checkcounter! == 256 (
    goto loopend
)
goto loopstart
:loopend

::Complile and List all IP Adresses
echo.
for /L %%a in (0,1,255) do (
    for /F %%b in (%%a.txt) do (
        nslookup %%b 2>&1 | find "Name" >nul
        if errorlevel 1 (
            set _iptag=NO DOMAIN
        ) else (
            for /F "tokens=2 delims= " %%c in ('nslookup %%b ^| find "Name"') do (
                set _iptag=%%c
            )
        )
        echo %%b - !_iptag!
        echo %%b - !_iptag! >> ipadr.txt
    )
    del %%a.txt 2>nul
    del status%%a.txt 2>nul
)


pause
endlocal
exit /B