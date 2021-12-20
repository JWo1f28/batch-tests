@echo off
echo cleanup-2: Delete all .txt files in %cd% >> log.txt
del "%cd%\*.txt" /f /q >>log.txt
exit /b
