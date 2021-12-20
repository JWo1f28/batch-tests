@echo off

setlocal enabledelayedexpansion

:pwgetstart
cls

::Vars
set _counter=1
set _network=

::Refresh wlanprof.txt
del wlanprof.txt 2>nul
copy nul wlanprof.txt 1>nul

::Obtain all wlan profiles
echo WLAN PROFILES > wlanprof.txt
netsh wlan show profile | find "User Profile" >> wlanprof.txt

::For each wlan profile

echo Please Enter the Network you wish to obtain the password to:
echo.
for /F "tokens=5 skip=1" %%a in (wlanprof.txt) do (
    echo [!_counter!] - %%a
    set /a _counter += 1
)

set /p _netsel=
set _counter=0

cls
echo Your Network Password is Listed below
echo.
echo If Password displays as blank, the network may be already public
echo or the key is encrypted
echo.

for /F "tokens=5 skip=%_netsel%" %%a in (wlanprof.txt) do (
    if !_counter! == 0 (
        netsh wlan show profile %%a key=clear | find "Key Content" > wlanprof.txt
        echo Network: %%a
        for /F "tokens=4" %%b in (wlanprof.txt) do (
            echo Key:     %%b
            echo.
        )
    )
    set /a _counter += 1
)

echo No Peeking :) > wlanprof.txt
echo.

:pwgetmenu
echo [R] - Run pwget again
echo.
echo [Q] - Quit to Menu
echo.

set /p _selection=

if %_selection%==r (
    goto pwgetstart
) else if %_selection%==R (
    goto pwgetstart
) else if %_selection%==q (
    exit /b
) else if %_selection%==Q (
    exit /b
) else (
    cls
    echo Input Not Recognised, Please try again
    echo.
    goto pwgetmenu
)

exit /b