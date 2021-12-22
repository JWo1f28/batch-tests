@echo off
echo pwget-2: PwGet Loaded >> log.txt
setlocal enabledelayedexpansion
echo pwget-6: Enter Usage Loop >> log.txt
:pwgetstart
cls
set _counter=1
set _network=
echo pwget-13: Vars Created >> log.txt
del wlanprof.txt 2>>log.txt
copy nul wlanprof.txt 1>>log.txt
echo pwget-18: wlanprof.txt refreshed >> log.txt
echo WLAN PROFILES > wlanprof.txt
netsh wlan show profile | find "User Profile" >> wlanprof.txt
echo pwget-23: WLAN Profiles copied >> log.txt
echo Please Enter the Network you wish to obtain the password to:
echo.
for /F "tokens=5 skip=1" %%a in (wlanprof.txt) do (
    echo [!_counter!] - %%a
    set /a _counter += 1
)
echo pwget-33: All WLAN profiles printed in menu style >> log.txt
set /p _netsel=
set _counter=0
echo pwget-37: Network selected  >> log.txt
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
echo pwget-57: Print Network and Password Info >> log.txt
echo No Peeking :) > wlanprof.txt
echo.
echo pwget-61: Remove Password from unprotected file >> log.txt
:pwgetmenu
echo [R] - Run pwget again
echo.
echo [Q] - Quit to Menu
echo.
echo pwget-68: Give User option to use tool again >> log.txt
set /p _selection=
if %_selection%==r (
    echo pwget-73: Return to Start of Loop >> log.txt
    goto pwgetstart
) else if %_selection%==R (
    echo pwget-76: Return to Start of Loop >> log.txt
    goto pwgetstart
) else if %_selection%==q (
    echo pwget-79: Return to Menu >> log.txt
    exit /b
) else if %_selection%==Q (
    echo pwget-82: Return to Menu >> log.txt
    exit /b
) else (
    cls
    echo Input Not Recognised, Please try again
    echo.
    echo pwget-88: Return to Input >> log.txt
    goto pwgetmenu
)
endlocal
echo pwget-93: Return to Menu >> log.txt
exit /b