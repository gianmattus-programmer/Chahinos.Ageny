@echo off
cd /d "c:\Users\chave\Downloads\modichahinos"

echo.
echo [*] Estado actual del repositorio:
git status

echo.
echo [*] Historial de commits:
git log --oneline -5

echo.
echo [+] Listo para conectar con GitHub
