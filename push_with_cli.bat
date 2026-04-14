@ECHO OFF
REM Script para subir a GitHub usando GitHub CLI (más simple y seguro)

echo.
echo ===================================================
echo   PUSH AUTOMATIZADO A GITHUB
echo ===================================================
echo.

cd /d "C:\Users\chave\Downloads\modichahinos"

REM Verificar si GitHub CLI está instalado
gh --version >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [!] GitHub CLI no está instalado
    echo.
    echo Instálalo con:
    echo.
    echo   winget install GitHub.cli
    echo.
    echo O descárgalo de: https://cli.github.com/
    echo.
    pause
    exit /b 1
)

echo [1] Configurando Git...
git config user.name "gianmattus-programmer" >nul 2>&1
git config user.email "chavezmattus@gmail.com" >nul 2>&1
echo     ✓ Configurado

echo. & echo [2] Verificando autenticación con GitHub...
gh auth status >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [!] No estás autenticado en GitHub
    echo .
    echo Ejecutando: gh auth login
    gh auth login
) else (
    echo    ✓ Autenticación OK
)

echo. & echo [3] Haciendo commit...
git add .
git commit -m "Optimizaciones rendimiento: Fonts display=swap, PostHog defer, Swiper defer" --allow-empty
echo     ✓ Commit listo

echo. & echo [4] Obteniendo rama actual...
FOR /F %%i IN ('git rev-parse --abbrev-ref HEAD') DO SET BRANCH=%%i
echo     Branch: %BRANCH%

echo. & echo [5] Agregando remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/gianmattus-programmer/Chahinos.Ageny.git
echo     ✓ Remote configurado

echo. & echo [6] Haciendo PUSH a GitHub...
git push -u origin %BRANCH%

if %ERRORLEVEL% EQU 0 (
    echo. & echo ===================================================
    echo  ✓ ÉXITO - Cambios subidos a GitHub!
    echo ===================================================
    echo.
    echo Puedes ver tus cambios en:
    echo https://github.com/gianmattus-programmer/Chahinos.Ageny
    echo.
) else (
    echo. & echo ===================================================
    echo  [!] ERROR - El push no se completó
    echo ===================================================
    echo.
    echo Asegúrate de:
    echo 1. Tener GitHub CLI instalado
    echo 2. Estar autenticado: gh auth login
    echo 3. Tener conexión a internet
    echo.
)

pause
