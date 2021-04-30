@ECHO OFF
net sess>nul 2>&1||(powershell saps '%0'-Verb RunAs&exit)
COLOR ec

:if-ngrok
echo Select a task:
echo =============
echo -
echo 1) Option 1(ngrok)
echo 2) Option 2(File Sahre)
echo 3) Option 3(Call)
echo 4) Option 4(Mail)
echo 5) Option 5(Exit)
echo -
set /p op=Type option:
if "%op%"=="1" goto if-ngrok-op1
if "%op%"=="2" goto ifngrokop2
if "%op%"=="3" goto op3
if "%op%"=="4" goto op4
if "%op%"=="5" goto cls op5
if "%op%"=="" cls goto if-ngrok



echo Please Pick an option:
goto if-ngrok


:if-ngrok-op1









if exist "%cd%\share\ngrok.exe" (



pushd share\
ngrok http "4444"
popd

cls
goto if-ngrok
)





if not exist "%cd%\share\ngrok.exe" (
cls

echo downloading the messing file please be patient
curl.exe -L "https://www.googleapis.com/drive/v3/files/1KTwpFu-r7ae3LTlzGgfAoeTtg2SkFTu2?alt=media&key=AIzaSyD5joKOoWWnjMLeGX8AYoI0Q4jJUnpjvD8" > "share.zip"







goto unzip
)




:unzip


set mypath=%cd%\share.zip
Call :UnZipFile "%cd%\share\" "%mypath%"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%


del share.zip



cls
goto if-ngrok








:ifngrokop2




title Created by Himel Sarkar
set mm=%cd%
cls
echo checking file structure...
if exist "%Temp%\ngrok-stable-windows-amd64\ngrok.exe" (
if exist "%Temp%\ngrok-stable-windows-amd64\ngrok.exe" (
cd \

cd %temp%
cd ngrok-stable-windows-amd64

start /b cmd.exe @cmd /k "cd %cd%\ &&  start "" http://127.0.0.1 && py -m http.server 80 --bind 127.0.0.1"
cls
ngrok http "file:///%cd%"

cls


pause
taskkill /F /IM ngrok.exe /T
 
 
cls
goto ifngrokop2
goto ok
)
)

if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
goto download
)
)
if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
goto download
)
)

if not exist "%temp%\ngrok-stable-windows-amd64.zip" (
goto download
)
)
:download
echo downloading missing files.
cd \
cd %temp%


curl.exe -L "https://www.googleapis.com/drive/v3/files/1KTwpFu-r7ae3LTlzGgfAoeTtg2SkFTu2?alt=media&key=AIzaSyD5joKOoWWnjMLeGX8AYoI0Q4jJUnpjvD8" > "ngrok-stable-windows-amd64.zip"

cd\
cd %temp%



set mypath=%cd%\ngrok-stable-windows-amd64.zip
Call :UnZipFile "%temp%\ngrok-stable-windows-amd64" "%mypath%"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%



cd \

cd %temp%
cd ngrok-stable-windows-amd64

start /b cmd.exe @cmd /k "cd %mm%\ && start "" http://127.0.0.1 && py -m http.server 80 --bind 127.0.0.1"
cls
ngrok http "file:///%mm%"
cd ..

erase /Q *.*
cls
echo for close it(ngrok-stable-windows-amd64) press enter
pause

taskkill /F /IM ngrok.exe /T

cls
goto ifngrokop2

:ok
echo Install successful





goto if-ngrok

:op3
:call
cls
echo Do call,
echo Choose an option from a below list.
echo 1. Call2friends
echo 2. Ievaphone
echo 3. Spoofmyphone
echo 4. Crazycall
echo 5. Exit
 
echo Enter your choice:
 
set /p choice=
 
if %choice%==1 (
start "" https://call2friends.com/free-calls
)
if %choice%==2 (
start "" https://ievaphone.com/
)
if %choice%==3 (
start ncpa.cpl 
)
if %choice%==4 (
start "" http://crazycall.net/
)

if %choice%==5 (
cls
goto if-ngrok
)

goto call:
echo you picked option 3
cls
PAUSE
goto if-ngrok
:op4
start "" https://emkei.cz/

echo you picked option 4
cls
goto if-ngrok 
:op5
echo you picked option 5
cls
goto if-ngrok 
