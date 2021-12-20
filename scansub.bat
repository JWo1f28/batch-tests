@echo off
set ip=%1
echo scansub-%1-3: Get IP from Passed Var >> log.txt
copy nul %ip%.txt 1>>log.txt
echo scansub-%1-5: Create IP txt file >> log.txt
for /l %%a in (1,1,1024) DO (
    echo open %ip% %%a > %ip%.txt
    echo quit >> %ip%.txt
    ftp -s:%ip%.txt 2>&1 | find "host" >nul
    if not errorlevel 1 (
        echo %ip% %%a >> ports.txt
    )
)
echo scansub-%1-16: scansub complete, deleting cache and updating checks.txt >> log.txt
del %ip%.txt
echo %ip% >> checks.txt
echo scansub-%1-19: Exiting >> log.txt
exit