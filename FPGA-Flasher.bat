@ECHO OFF
SET bitfile=%1
if "%~x1" NEQ ".bit" goto error
set path=%~dp0
:con
cls
@ECHO OFF
color E
echo -----------------------------------------------v3.5-------------------------------------
echo  ______ _____   _____            ______ _ By Shi_ba'San  _____ _    _ ______ _____  
echo ^|  ____^|  __ \ / ____^|   /\     ^|  ____^| ^|        /\    / ____^| ^|  ^| ^|  ____^|  __ \ 
echo ^| ^|__  ^| ^|__) ^| ^|  __   /  \    ^| ^|__  ^| ^|       /  \  ^| (___ ^| ^|__^| ^| ^|__  ^| ^|__) ^|
echo ^|  __^| ^|  ___/^| ^| ^|_ ^| / /\ \   ^|  __^| ^| ^|      / /\ \  \___ \^|  __  ^|  __^| ^|  _  /   
echo ^| ^|    ^| ^|    ^| ^|__^| ^|/ ____ \  ^| ^|    ^| ^|____ / ____ \ ____) ^| ^|  ^| ^| ^|____^| ^| \ \ 
echo ^|_^|    ^|_^|     \_____/_/    \_\ ^|_^|    ^|______/_/    \_\_____/^|_^|  ^|_^|______^|_^|  \_\   
echo -----------------------------------------------------------------------------------------
echo -----------------------------
echo File Bit From %bitfile%
echo -----------------------------
echo   1 For Normal Rom (Fast - Temporary)
echo   2 For PROM Rom (Slow - Permanent)
echo -----------------------------
set /P INPUT=Type of Flash: %=%
if %input%==1 goto normal
if %input%==2 goto prom
goto con
:normal
xc3sprog.exe -c ftdi -L -v -p 0 %bitfile%
PAUSE
goto con
:prom
xc3sprog.exe -c ftdi -L "%~dp0\spiflasherLX9.bit"
xc3sprog.exe -c ftdi -L -v -R -p 0 -I %bitfile%
PAUSE
goto con
:error
cls
color c
echo ----------------------------------------
echo ERROR. Don't just Run me only 
echo Please Drag *.bit file type only from your project to me !.
echo ----------------------------------------
PAUSE  
