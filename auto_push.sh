#!/usr/bin/env bash

cd "c:\Users\chave\Downloads\modichahinos"

echo "=== VERIFICANDO ESTADO GIT ==="
git status

echo ""
echo "=== HACIENDO COMMIT ==="
git commit -m "Optimizaciones de rendimiento: Fonts display=swap, PostHog defer, Swiper defer" --allow-empty

echo ""
echo "=== VIENDO RAMA ACTUAL ==="
git branch -a

echo ""
echo "=== AGREGANDO REMOTE (si no existe) ==="
git remote add origin https://github.com/gianmattus-programmer/Chahinos.Ageny.git 2>/dev/null || git remote set-url origin https://github.com/gianmattus-programmer/Chahinos.Ageny.git

echo ""
echo "=== PREPARADO PARA HACER PUSH ==="
echo "Ejecuta este comando:"
echo "git push -u origin main"
