@echo off

echo Installing VcXsrv...
winget -e install marha.VcXsrv

echo Adding User Environment Variables (DISPLAY and TMPDIR)
setx DISPLAY "127.0.0.1:0.0"
setx TMPDIR "%TMP%"

echo Adding XAuthLocation to user's SSH Config
set ssh_config=%USERPROFILE%\.ssh\config

if not exist %ssh_config% (
    type nul >> %ssh_config%
)

set test=""
FINDSTR /L /I /N /C:"XAuthLocation" %ssh_config% > nul

IF ERRORLEVEL 1 (
    echo "`nXAuthLocation C:\Progra~1\\VcXsrv\\xauth.exe" >> %ssh_config%
    echo XAuthLocation added
) ELSE (
    echo XAuthLocation already defined..
)