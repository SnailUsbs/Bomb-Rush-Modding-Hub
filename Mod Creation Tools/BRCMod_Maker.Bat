@echo off
setlocal enabledelayedexpansion
set "ROOT=%~dp0"
set "ROOT=%ROOT:~0,-1%"
cd /d "%ROOT%"

set BUILT=0
set FAILED=0

for %%f in ("%ROOT%\*.csproj") do (
    set "name=%%~nf"
    echo.
    echo Building !name!...
    dotnet build "%%f" --configuration Release -nologo -v q
    if !errorlevel! equ 0 (
        set /a BUILT+=1
        echo   OK
    ) else (
        set /a FAILED+=1
        echo   FAILED
    )
)

echo.
echo Done. Built: %BUILT%  Failed: %FAILED%
pause
