@echo off
if exist C:\PAPERSTUDIOS\Temp (
    goto ip01
) else (
    mkdir C:\PAPERSTUDIOS\Temp
    goto ip01
)
:ip01
call C:\PAPERSTUDIOS\Services\DownloadService.bat "https://raw.githubusercontent.com/rotvproHD/PAPER-MINETHBA/main/version.txt" -saveTo C:\PAPERSTUDIOS\Temp\MINETHBAver.txt
FOR /F "delims=|" %%h in (C:\PAPERSTUDIOS\Temp\MINETHBAver.txt) DO (
echo LOADING... [1/1]
set version=%%h
)
set version=0.0.2
if %version% EQU %version% (
    goto ip02
) else (
    goto update
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
if exist C:\PAPERSTUDIOS\MINETHBA\data01.txt (
    goto skipfirst
) else (
    goto setup
)
:skipfirst
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
del C:\PAPERSTUDIOS\Temp\minethbainstaller.bat
exit
)
:setup
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
goto skipfirst
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
if %upd% EQU 2 (
    goto ip02
)
goto update
