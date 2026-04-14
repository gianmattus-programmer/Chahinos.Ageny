@ECHO OFF
REM Pasos manuales para hacer push (sin interactividad)

cd /d "C:\Users\chave\Downloads\modichahinos"

echo.
echo ===================================================
echo   PREPARANDO PARA SUBIR A GITHUB
echo ===================================================
echo.

echo [PASO 1] Configurando Git local...
git config user.name "gianmattus-programmer"
git config user.email "chavezmattus@gmail.com"
echo ✓ Hecho

echo.
echo [PASO 2] Agregando todos los cambios...
git add .
echo ✓ Hecho

echo.
echo [PASO 3] Creando commit...
git commit -m "Optimizaciones rendimiento: Fonts display=swap, PostHog defer, Swiper defer, Vimeo fix"
echo ✓ Hecho

echo.
echo [PASO 4] Configurando remote origin...
git remote remove origin 2>nul
git remote add origin https://github.com/gianmattus-programmer/Chahinos.Ageny.git
echo ✓ Hecho

echo.
echo ===================================================
echo   AHORA EJECUTA EN LA TERMINAL:
echo ===================================================
echo.
echo   git push -u origin main
echo.
echo ===================================================
echo.
echo Si pide Usuario y Contraseña:
echo  - Usuario: gianmattus-programmer
echo  - Password: Tu Personal Access Token (o contraseña GitHub)
echo.
echo Para crear token:
echo https://github.com/settings/tokens
echo.

pause
