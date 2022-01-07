@echo off

setlocal
echo IP
set /p input=
set display=
echo %input% > temp.txt
set counter=1
goto selections

:binary

set bin1=0
set bin2=0
set bin3=0
set bin4=0
set bin5=0
set bin6=0
set bin7=0
set bin8=0
if %tempcalc% GEQ 128 (
    set bin1=1
    set /a tempcalc-=128
)
if %tempcalc% GEQ 64 (
    set bin2=1
    set /a tempcalc-=64
)
if %tempcalc% GEQ 32 (
    set bin3=1
    set /a tempcalc-=32
)
if %tempcalc% GEQ 16 (
    set bin4=1
    set /a tempcalc-=16
)
if %tempcalc% GEQ 8 (
    set bin5=1
    set /a tempcalc-=8
)
if %tempcalc% GEQ 4 (
    set bin6=1
    set /a tempcalc-=4
)
if %tempcalc% GEQ 2 (
    set bin7=1
    set /a tempcalc-=2
)
if %tempcalc% GEQ 1 (
    set bin8=1
    set /a tempcalc-=1
)
set construct%counter%=%bin1%%bin2%%bin3%%bin4%%bin5%%bin6%%bin7%%bin8%

:selections

if %counter% EQU 1 (
    for /F "delims=. tokens=1" %%a in (temp.txt) do (
        set tempcalc=%%a
        set display=%%a
    )
    set /a counter+=1
    goto binary
) else if %counter% EQU 2 (
    for /F "delims=. tokens=2" %%a in (temp.txt) do (
        set tempcalc=%%a
        set display=%%a
    )
    set /a counter+=1
    goto binary
) else if %counter% EQU 3 (
    for /F "delims=. tokens=3" %%a in (temp.txt) do (
        set tempcalc=%%a
        set display=%%a
    )
    set /a counter+=1
    goto binary
) else if %counter% EQU 4 (
    for /F "delims=. tokens=4" %%a in (temp.txt) do (
        set tempcalc=%%a
        set display=%%a
    )
    set /a counter+=1
    goto binary
)

echo %input% = %construct2%%construct3%%construct4%%construct5%

pause
exit /b