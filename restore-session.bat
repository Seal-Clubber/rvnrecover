@echo off
cd hashcat
hashcat.exe --session=ravencoin --restore
cd ..
for /f "tokens=2 delims=:" %%x in (password.txt) do set password=%%x
echo.
echo ----------------------------------------------------
echo Password:
echo.
echo %password%
echo.
echo ----------------------------------------------------
pause