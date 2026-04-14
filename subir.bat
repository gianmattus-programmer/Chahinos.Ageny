@ECHO OFF
REM Script para subir cambios rápidamente a GitHub

cd /d "C:\Users\chave\Downloads\modichahinos"

echo.
echo ===================================================
echo   SUBIENDO CAMBIOS A GITHUB
echo ===================================================
echo.

REM Pedirle al usuario un mensaje de commit
set /p MENSAJE="Describe los cambios que hiciste: "

if "%MENSAJE%"=="" (
    set MENSAJE=Actualización de cambios
)

echo.
echo [1] Preparando archivos...
git add .
echo     ✓ Hecho

echo. & echo [2] Creando commit con mensaje: "%MENSAJE%"
git commit -m "%MENSAJE%"
echo     ✓ Hecho

echo. & echo [3] Subiendo a GitHub...
git push
echo     ✓ Hecho

echo.
echo ===================================================
echo  ✓ CAMBIOS SUBIDOS A GITHUB!
echo ===================================================
echo.
echo Puedes verlos en:
echo https://github.com/gianmattus-programmer/Chahinos.Ageny
echo.
pause
