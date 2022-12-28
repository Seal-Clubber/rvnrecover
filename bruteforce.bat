@echo off

REM put wallet.dat file in base folder and run bruteforce.bat
REM restore.bat restores hashcat session that had made some progress but closed for whatever reason
REM change the masking on hashcat to your own liking

cd python2.7.8
python.exe ../bitcoin2john.py ../wallet.dat > ../wallet.hash
cd ..
echo Wallet Hash:
echo.
type wallet.hash
echo.
echo ----------------------------------------------------
echo.
cd hashcat
hashcat.exe -a 3 -o ../password.txt --increment --session=ravencoin -m 11300 ../wallet.hash -1 ?l?u?d*!$@_ ?1?1?1?1?1?1?1?1
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