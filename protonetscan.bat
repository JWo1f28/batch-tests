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

for /L %%a in (0,1,255) do (
    start /min netsub.bat %_domain% %%a
)

::Checking Loop


pause
endlocal
exit /B