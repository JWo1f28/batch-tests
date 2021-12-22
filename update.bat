@echo off
rmdir /S /Q temp 2>nul
mkdir temp 1>nul
del replace.bat 2>nul
copy nul replace.bat 1>nul
git clone https://github.com/JWo1f28/batch-tests temp
echo @echo off >> replace.bat
echo xcopy "%cd%/temp" "%cd%"  /Y /E /Q >> replace.bat
echo rmdir /S /Q temp >> replace.bat
echo start menu.bat >> replace.bat
echo exit >> replace.bat
start replace.bat
exit