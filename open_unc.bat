@echo off
if "%~1"=="" (
    reg add "HKCU\SOFTWARE\Classes\openunc" /ve /d "URL:Open UNC Path" /f >nul
    reg add "HKCU\SOFTWARE\Classes\openunc" /v "URL Protocol" /d "" /f >nul
    reg add "HKCU\SOFTWARE\Classes\openunc\shell\open\command" /ve /d "\"%~f0\" \"%%1\"" /f >nul
    echo Susses registed!
    echo.
    echo now click ip in web 
    pause
) else (
    setlocal
    set "arg=%~1"
    set "ip=%arg:openunc://=%"
    set "ip=%ip:openunc:=%"
    start "" explorer.exe \\%ip%
    endlocal
)
