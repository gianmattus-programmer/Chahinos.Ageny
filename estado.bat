@ECHO OFF
REM Ver qué cambios hay pendientes

cd /d "C:\Users\chave\Downloads\modichahinos"

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
