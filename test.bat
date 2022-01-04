@echo off
setlocal enabledelayedexpansion

for /L %%a in (0,1,255) do (
    for /F "delims= " %%b in (ipadr.txt) do (
        if not %%b == DONE (
            set _ipadr=%%b
        )
    )
    for /F "delims=- tokens=2" %%c in (ipadr.txt) do (
        if not %%c == DONE (
            set _domname=%%c
        )
    )
    echo !_ipadr! - !_domname!
)

pause
endlocal
exit /b