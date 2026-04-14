@echo off
cd /d "C:\Users\chave\Downloads\modichahinos"

echo.
echo ===================================================
echo   PUSH A GITHUB - Pasos para subir tus cambios
echo ===================================================
echo.

echo [PASO 1] Ver estado actual:
git status
echo.

echo [PASO 2] Archivo de remote:
git remote -v
echo.

echo ===================================================
echo   INSTRUCCIONES PARA HACER PUSH:
echo ===================================================
echo.
echo Opcion A - Si ya tienes el remote configurado:
echo   git push -u origin master
echo.
echo Opcion B - Si quieres agregar el remote:
echo   git remote add origin https://github.com/gianmattus-programmer/Chahinos.Ageny.git
echo   git branch -M main
echo   git push -u origin main
echo.
echo.
pause
