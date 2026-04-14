@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION

cd /d "C:\Users\chave\Downloads\modichahinos"

echo. & echo [*] Configurando Git...
git config user.name "gianmattus-programmer" >nul 2>&1
git config user.email "chavezmattus@gmail.com" >nul 2>&1

echo [*] Haciendo commit...
git commit -m "Optimizaciones rendimiento: Fonts display=swap, PostHog defer, Swiper defer, Vimeo fix" --allow-empty

echo. & echo [*] Agregando remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/gianmattus-programmer/Chahinos.Ageny.git

echo. & echo [*] Verficando rama...
FOR /F %%i IN ('git rev-parse --abbrev-ref HEAD') DO SET BRANCH=%%i
echo Branch actual: !BRANCH!

echo. & echo [*] Intentando push...
echo Ejecutando: git push -u origin !BRANCH!
echo.

git push -u origin !BRANCH!

if !ERRORLEVEL! EQU 0 (
    echo. & echo [OK] Push completado exitosamente!
    echo. & echo Puedes ver tus cambios en:
    echo https://github.com/gianmattus-programmer/Chahinos.Ageny
) else (
    echo. & echo [ERROR] El push falló
    echo Puede ser por:
    echo - Autenticación requerida (pega tu Personal Access Token)
    echo - GitHub CLI no instalada
    echo. & echo Intenta instalar GitHub CLI:
    echo winget install GitHub.cli
    echo. & echo Y luego:
    echo gh auth login
)

echo. & pause
