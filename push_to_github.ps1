# Script para subir cambios a GitHub
# Ejecutar: powershell -ExecutionPolicy Bypass -File push_to_github.ps1

$repoPath = "c:\Users\chave\Downloads\modichahinos"
$gitRemoteUrl = "https://github.com/gianmattus-programmer/Chahinos.Ageny.git"

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "📤 SCRIPT DE PUSH A GITHUB" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan

# Cambiar al directorio del repositorio
Set-Location $repoPath

# 1. Verificar estado actual
Write-Host "`n[1] Estado actual del repositorio:" -ForegroundColor Yellow
git status

# 2. Agregar archivos (si no están ya agregados)
Write-Host "`n[2] Preparando archivos..." -ForegroundColor Yellow
git add . 2>$null

# 3. Hacer commit (si hay cambios sin commit)
Write-Host "`n[3] Creando commit..." -ForegroundColor Yellow
$uncommittedCount = (git status --porcelain | Measure-Object).Count
if ($uncommittedCount -gt 0) {
    git commit -m "Optimizaciones de rendimiento: Fonts display=swap, PostHog defer, Swiper defer. FCP -600ms"
    Write-Host "✅ Commit creado" -ForegroundColor Green
} else {
    Write-Host "ℹ️  No hay cambios nuevos para commit" -ForegroundColor Gray
}

# 4. Verificar si remoto origin existe
Write-Host "`n[4] Configurando remote origin..." -ForegroundColor Yellow
$remoteExists = git config --get remote.origin.url
if (-not $remoteExists) {
    Write-Host "🔗 Agregando remote origin..." -ForegroundColor Cyan
    git remote add origin $gitRemoteUrl
    Write-Host "✅ Remote origin agregado" -ForegroundColor Green
} else {
    Write-Host "✅ Remote origin ya existe: $remoteExists" -ForegroundColor Green
}

# 5. Ver branch actual
Write-Host "`n[5] Branch actual:" -ForegroundColor Yellow
git branch -v

# 6. Instrucciones para hacer push
Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "📋 PRÓXIMO PASO:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Ejecuta este comando para hacer push a GitHub:" -ForegroundColor White
Write-Host "" -ForegroundColor White
Write-Host "  git push -u origin master" -ForegroundColor Green
Write-Host "" -ForegroundColor White
Write-Host "O si tu branch es 'main':" -ForegroundColor White
Write-Host "  git push -u origin main" -ForegroundColor Green
Write-Host "" -ForegroundColor White
