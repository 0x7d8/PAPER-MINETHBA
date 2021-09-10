::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGmlxGcCGy9haC2tD1eeB6Ed1MXSwc+zim88aO82doqV36yLQA==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
if exist C:\PAPERSTUDIOS\Data\MINETHBA\data01.txt (
title MINETHBA - LOADING
FOR /F "delims=|" %%f in (C:\PAPERSTUDIOS\Data\MINETHBA\data01.txt) DO (
echo LOADING... [1/2]
set wallet=%%f
)
ping localhost -n 2 >nul
FOR /F "delims=|" %%a in (C:\PAPERSTUDIOS\Data\MINETHBA\data02.txt) DO (
echo LOADING... [2/2]
set worker=%%a
)
goto start
) else (
title MINETHBA - SETTING UP
if exist C:\PAPERSTUDIOS\Temp (
    goto ip01
) else (
    mkdir C:\PAPERSTUDIOS\Temp
    goto ip01
)
call C:\PAPERSTUDIOS\Services\DownloadService.bat "https://raw.githubusercontent.com/rotvproHD/PAPER-MINETHBA/main/version.txt" -saveTo C:\PAPERSTUDIOS\Temp\MINETHBAver.txt
FOR /F "delims=|" %%h in (C:\PAPERSTUDIOS\temp\MINETHBAver.txt) DO (
echo LOADING... [1/1]
set latest=%%h
set version=0.0.2
if %latest% EQU %version% (
    goto ip02
) else (
    goto update
)
)
:ip02
if exist C:\PAPERSTUDIOS\Data\MINETHBA (
    goto su01
) else (
    mkdir C:\PAPERSTUDIOS\Data\MINETHBA
    goto su01
)
:su01
if exist C:\PAPERSTUDIOS\Data\MINETHBA\miners (
    goto su02
) else (
    mkdir C:\PAPERSTUDIOS\Data\MINETHBA\miners
    goto su02
)
:su02
call C:\PAPERSTUDIOS\Services\DownloadService.bat "https://github.com/trexminer/T-Rex/releases/download/0.21.6/t-rex-0.21.6-win.zip" -saveTo C:\PAPERSTUDIOS\Downloads\trex.zip

echo WELCOME!
ping localhost -n 2 >nul
echo USE THIS TOOL TO MINE ETHEREUM!
ping localhost -n 2 >nul
cls
echo YOU NEED WINRAR TO CONTINUE...
pause
cls
echo Ethermine Wallet ID:
set /p wallet=ID: 
cls
ehco ...
ping localhost -n 1 >nul
cls
echo Ethermine Worker ID:
set /p worker=ID: 
cls
echo ...
"C:\Program Files\Winrar\WinRAR.exe" x "C:\PAPERSTUDIOS\Downloads\trex.zip" *.* "C:\PAPERSTUDIOS\Data\MINETHBA\miners\"
ping localhost -n 2 >nul
cls
echo THANKS!
FOR %%a IN ("C:\PAPERSTUDIOS\Data\MINETHBA\miners\*") DO IF /i NOT "%%~nxa"=="t-rex.exe" DEL "%%a"
:ip01
del C:\PAPERSTUDIOS\Downloads\trex.zip
call C:\PAPERSTUDIOS\Services\DownloadService.bat "https://github.com/rotvproHD/PAPER-MINETHBA/raw/main/mine.exe" -saveTo C:\PAPERSTUDIOS\Data\MINETHBA\mine.exe
call C:\PAPERSTUDIOS\Services\DownloadService.bat "https://raw.githubusercontent.com/rotvproHD/PAPER-MINETHBA/main/shortcu.bat" -saveTo C:\PAPERSTUDIOS\Data\MINETHBA\shortcu.bat
call C:\PAPERSTUDIOS\Services\DownloadService.bat "https://github.com/rotvproHD/PAPER-MINETHBA/raw/main/icon.ico" -saveTo C:\PAPERSTUDIOS\Data\MINETHBA\icon.ico
ping localhost -n 4 >nul
(
ECHO %wallet%
) >C:\PAPERSTUDIOS\Data\MINETHBA\data01.txt
(
ECHO %worker%
) >C:\PAPERSTUDIOS\Data\MINETHBA\data02.txt
title MINETHBA - LOADING
FOR /F "delims=|" %%f in (C:\PAPERSTUDIOS\Data\MINETHBA\data01.txt) DO (
echo LOADING... [1/2]
set wallet=%%f
)
ping localhost -n 2 >nul
FOR /F "delims=|" %%a in (C:\PAPERSTUDIOS\Data\MINETHBA\data02.txt) DO (
echo LOADING... [2/2]
set worker=%%a
)
start C:\PAPERSTUDIOS\Data\MINETHBA\shortcu.bat
start C:\PAPERSTUDIOS\Data\MINETHBA\mine.exe
ping localhost -n 2 >nul
del C:\PAPERSTUDIOS\Data\MINETHBA\shortcu.bat
exit
)
:update
cls
echo THERE IS A UPDATE AVAILABLE
echo.
echo [1] INSTALL
echo [2] SKIP (not recommended)
echo.
set /p upd=: 
if %upd% EQU 1 (
    call C:\PAPERSTUDIOS\Services\DownloadService.bat "https://raw.githubusercontent.com/rotvproHD/PAPER-MINETHBA/main/installer.bat" -saveTo C:\PAPERSTUDIOS\Temp\minethbainstaller.bat
    start C:\PAPERSTUDIOS\Temp\minethbainstaller.bat
    exit
)
:start
cls
title MINETHBA - MAIN MENU
echo WELCOME BACK!
echo.
echo [1] Mine
echo [2] Config
echo [3] Exit
echo.
set /p mmnu=: 
if %mmnu% EQU 3 (
cls
title MINETHBA - BYE
echo BYE!
ping localhost -n 2 >nul
exit
)
if %mmnu% EQU 2 (
goto config
)
if %mmnu% EQU 1 (
goto mining
)
goto start
:config
cls
if exist C:\PAPERSTUDIOS\Data\MINETHBA\data69.txt (
set antivirus=ENABLED
) else (
set antivirus=DISABLED
)
title MINETHBA - CONFIG
echo CONFIG!
echo.
echo [1] Wallet ID [CURRENT: %wallet%]
echo [2] Worker ID [CURRENT: %worker%]
echo [3] Antivirus [CURRENT: %antivirus%]
echo [4] Back
echo.
(
ECHO %worker%
) >C:\PAPERSTUDIOS\Data\MINETHBA\data02.txt
(
ECHO %wallet%
) >C:\PAPERSTUDIOS\Data\MINETHBA\data01.txt
set /p cmnu=: 
if %cmnu% EQU 1 (
cls
title MINETHBA - CONFIG - WALLET-ID
echo STEP 1 OF 2
echo ////////////
echo.
echo NEW WALLET ID:
set /p wallet=ID:
cls
echo STEP 2 OF 2
echo ////////////
echo THANKS!
(
ECHO %wallet%
) >C:\PAPERSTUDIOS\Data\MINETHBA\data01.txt
ping localhost -n 2 >nul
goto config
)
if %cmnu% EQU 2 (
cls
title MINETHBA - CONFIG - WORKER-ID
echo STEP 1 OF 2
echo ////////////
echo.
echo NEW WORKER ID:
set /p worker=ID:
cls
echo STEP 2 OF 2
echo ////////////
echo THANKS!
(
ECHO %worker%
) >C:\PAPERSTUDIOS\Data\MINETHBA\data02.txt
ping localhost -n 2 >nul
goto config
)
if %cmnu% EQU 3 (
goto antivirset
)
if %cmnu% EQU 4 (
goto start
)
goto config
:mining
title MINETHBA - CONFIG - ALGORITHM
cls
echo STEP 2 OF 4
echo ////////////
echo.
echo ALGROITHM?
echo.
echo [1] ETHASH
echo [2] KAWPOW
echo [3] BACK
echo.
set /p algo=: 
if %algo% EQU 1 (
set algorithm=ETHASH
goto mstart
)
if %algo% EQU 2 (
set algorithm=KAWPOW
goto mstart
)
if %algo% EQU 3 (
goto start
)
goto mining
:antivirset
cls
title MINETHBA - CONFIG - ANTIVIRUS
echo STEP 1 OF 1
echo ////////////
echo.
echo ANTIVIRUS SKIP?
echo.
echo [1] ENABLE
echo [2] DISABLE
echo.
set /p antvir=: 
cls
if %antvir% EQU 1 (
echo true > C:\PAPERSTUDIOS\Data\MINETHBA\data69.txt
goto config
)
if %antvir% EQU 2 (
if exist C:\PAPERSTUDIOS\Data\MINETHBA\data69.txt (
del C:\PAPERSTUDIOS\Data\MINETHBA\data69.txt
)
goto config
)
:mstart
cls
title MINETHBA - LOADING
echo SELECTED...!
ping localhost -n 2 >nul
if exist C:\PAPERSTUDIOS\Data\MINETHBA\data69.txt (
goto minerstartr
) else (
goto antivirus
)
:antivirus
title MINETHBA - CONFIG - ANTIVIRUS
cls
echo STEP 3 OF 4
echo ////////////
echo.
echo IS YOUR ANTIVIRUS TURNED OFF?
echo.
echo [1] YES, CONTINUE
echo [2] YES, ALWAYS (Remember)
echo [3] BACK
set /p antivirus=: 
if %antivirus% EQU 1 (
goto minerstartr
)
if %antivirus% EQU 2 (
echo true > C:\PAPERSTUDIOS\Data\MINETHBA\data69.txt
goto minerstartr
)
if %antivirus% EQU 3 (
goto mining
)
goto antivirus
:minerstartr
cls
echo STEP 4 OF 4
echo ////////////
echo.
echo PLEASE WAIT...
title MINETHBA - MINING WITH %algorithm%...
cd miners
if %algo% EQU 1 (
t-rex.exe -a ethash -o stratum+tcp://eu1.ethermine.org:4444 -u %wallet% -p x -w %worker%
goto start
) else (
t-rex.exe -a -o stratum+tcp://kawpow.eu-north.nicehash.com:3385 -u %wallet% -p x -w %worker%
goto start
)
