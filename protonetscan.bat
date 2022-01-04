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

for /L %%a in (0,1,1) do (
    start /min netsub.bat %_domain% %%a
    copy nul %%a.txt 1>nul
)

::Checking Loop

:loopstart

set _checkcounter=0
for /L %%a in (0,1,1) do (
    for /F %%b in (%%a.txt) do (
        if %%b == DONE (
            set /a _checkcounter+=1
        )
    )
)
cls
echo !_checkcounter! / 2

if !_checkcounter! == 2 (
    goto loopend
)
goto loopstart
:loopend
for /L %%a in (0,1,1) do (
    for /F "delims=|" %%b in (%%a.txt) do (
        
    ) 
)


pause
endlocal
exit /B