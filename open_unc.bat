@echo off
if "%~1"=="" (
    reg add "HKCU\SOFTWARE\Classes\openunc" /ve /d "URL:Open UNC Path" /f >nul
    reg add "HKCU\SOFTWARE\Classes\openunc" /v "URL Protocol" /d "" /f >nul
    reg add "HKCU\SOFTWARE\Classes\openunc\shell\open\command" /ve /d "\"%~f0\" \"%%1\"" /f >nul
    echo ลงทะเบียนเรียบร้อยแล้ว!
    echo.
    echo ตอนนี้คลิก IP ใน web ได้เลย
    pause
) else (
    setlocal
    set "arg=%~1"
    set "ip=%arg:openunc:=%"
    start explorer.exe \\%ip%
    endlocal
)
