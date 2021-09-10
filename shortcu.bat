set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\MINETHBA.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.WorkingDirectory = "C:\PAPERSTUDIOS\Data\MINETHBA" >> %SCRIPT%
echo oLink.TargetPath = "C:\PAPERSTUDIOS\Data\MINETHBA\mine.exe" >> %SCRIPT%
echo oLink.IconLocation = "C:\PAPERSTUDIOS\Data\MINETHBA\icon.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
exit
