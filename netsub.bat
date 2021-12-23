@echo off
setlocal
::Netscan Slave Batch
set _toping=%1.%2
echo %_toping% >> domain.txt
endlocal
exit