@echo off
set ip=%1
copy nul %ip%.txt 1>nul
for /l %%a in (1,1,1024) DO (
    echo open %ip% %%a > %ip%.txt
    echo quit >> %ip%.txt
    ftp -s:%ip%.txt 2>&1 | find "host" >nul
    if not errorlevel 1 (
        echo %ip% %%a >> ports.txt
    )
)
del %ip%.txt
echo %ip% >> checks.txt
exit