@echo off
cd /d "%~dp0"

echo.
echo ========================================
echo       ATUALIZANDO MAPA NOTURNO
echo ========================================
echo.

git add .

git diff --cached --quiet
if %errorlevel%==0 (
    echo.
    echo Nenhuma alteracao encontrada.
    echo.
    pause
    exit /b
)

git commit -m "Atualizacao automatica do mapa"

if errorlevel 1 (
    echo.
    echo ERRO ao criar o commit.
    echo.
    pause
    exit /b
)

git push

if errorlevel 1 (
    echo.
    echo ERRO ao enviar para o GitHub.
    echo.
    pause
    exit /b
)

echo.
echo ========================================
echo       MAPA NOTURNO ATUALIZADO!
echo ========================================
echo.
pause