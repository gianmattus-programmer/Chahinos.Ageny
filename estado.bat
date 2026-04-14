@ECHO OFF
REM Ver qué cambios hay pendientes

cd /d "C:\Users\chave\Downloads\modichahinos"

1. Edita un archivo (HTML, CSS, JS, etc.)
2. Guarda (Ctrl+S)
3. Ejecuta: .\subir.bat
4. Escribe una descripción del cambio
5. ¡LISTO! Los cambios están en GitHub en 5 segundos

echo.
echo ===================================================
echo   CAMBIOS PENDIENTES DE SUBIR
echo ===================================================
echo.

git status

echo.
echo ===================================================
echo   ULTIMOS COMMITS
echo ===================================================
echo.

git log --oneline -5

echo.
pause
