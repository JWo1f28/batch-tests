@echo off
setlocal enabledelayedexpansion

cls
echo.
echo.
echo FAST NETSCAN
echo.

::Refresh domain.txt
del domain.txt 2>nul
copy nul domain.txt 1>nul
copy nul protonscan.txt 1>nul

::Vars
set _domain1=
set _domain2=
set _domain=

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
echo.
echo.
echo STARTING SLAVE BATCHES

for /L %%a in (0,1,255) do (
    start /min netsub.bat %_domain% %%a
)

::Checking Loop

:loopstart

set _checkcounter=0
for /F %%a in (protonscan.txt) do (
    set /a _checkcounter+=1
)
if !_checkcounter! EQU 256 (
    goto loopend
)
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"
for /f %%a in ('"prompt $H&for %%b in (0) do rem"') do set "BS=%%a"
<nul set /p"=!BS!!CR!!_checkcounter!/256 COMPLETE"
goto loopstart
:loopend
for /L %%a in (0,1,255) do (
    for /F %%b in (%%a.txt) do (
        echo %%b >> ipadr.txt
        echo %%b
    )
    del %%a.txt 2>nul
    pause
)
pause
endlocal
exit /B