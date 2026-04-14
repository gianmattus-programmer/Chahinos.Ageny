# 📤 GUÍA: SUBIR CAMBIOS A GITHUB

**Tu repositorio:** `https://github.com/gianmattus-programmer/Chahinos.Ageny.git`

---

## ✅ **PASO 1: Abrir Terminal en la Carpeta**

Opción A (Recomendada - Git Bash):
```bash
cd C:\Users\chave\Downloads\modichahinos
```

Opción B (PowerShell):
```powershell
Set-Location "C:\Users\chave\Downloads\modichahinos"
```

Opción C (CMD):
```cmd
cd /d C:\Users\chave\Downloads\modichahinos
```

---

## 📋 **PASO 2: Verificar Cambios**

```bash
git status
```

**Deberías ver:**
- ✅ `index.html` modificado
- ✅ `Nosotros/index.html` modificado
- ✅ `Proyectos/index.html` modificado
- ✅ `Contacto/index.html` modificado
- ✅ Otros archivos HTML optimizados
- ✅ `OPTIMIZACIONES_COMPLETADAS.md` agregado
- ✅ `vimeo-fix.js` agregado

---

## 🔧 **PASO 3: Agregar Archivos**

```bash
git add .
```

Verifica con:
```bash
git status
```

**Deberías ver:** "Changes to be committed"

---

## 💾 **PASO 4: Hacer Commit**

```bash
git commit -m "Optimizaciones de rendimiento: Fonts display=swap, PostHog defer, Swiper defer"
```

Verifica con:
```bash
git log --oneline -1
```

---

## 🔗 **PASO 5: Configurar Remote (Solo si no existe)**

Primero, verifica si ya existe:
```bash
git remote -v
```

Si NO ve ningún remote, ejecuta:
```bash
git remote add origin https://github.com/gianmattus-programmer/Chahinos.Ageny.git
```

Verifica:
```bash
git remote -v
```

**Deberías ver:**
```
origin  https://github.com/gianmattus-programmer/Chahinos.Ageny.git (fetch)
origin  https://github.com/gianmattus-programmer/Chahinos.Ageny.git (push)
```

---

## 🚀 **PASO 6: PUSH A GITHUB**

Ejecuta uno de estos comandos según tu rama:

### Opción A - Si tienes rama `main`:
```bash
git push -u origin main
```

### Opción B - Si tienes rama `master`:
```bash
git push -u origin master
```

### Opción C - Ver qué rama tienes:
```bash
git branch
```

Verás algo como:
- `* main` (o `* master`)

Luego usa el comando correspondiente arriba.

---

## 🔐 **PASO 7: Autenticación en GitHub**

Cuando ejecutes el push, te pedirá autenticación. Tienes 2 opciones:

### Opción A - Usar GitHub CLI (Recomendado)
```bash
# Instala GitHub CLI si aún no lo tienes
winget install GitHub.cli

# Autentica
gh auth login
```

### Opción B - Usar Personal Access Token
1. Ve a: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Dale nombre: "Git Commits"
4. Selecciona scope: `repo`, `workflow`
5. Click "Generate token"
6. Copia el token
7. En Git, cuando te pida contraseña, pega el token:
   ```
   Username: gianmattus-programmer
   Password: <pega-tu-token-aqui>
   ```

### Opción C - Usar credenciales SSH (Avanzado)
Si ya tienes SSH configurado:
```bash
# Cambia la URL a SSH
git remote set-url origin git@github.com:gianmattus-programmer/Chahinos.Ageny.git

# Luego push
git push -u origin main
```

---

## ✅ **VERIFICA QUE TODO FUNCIONÓ**

Después del push, deberías ver:
```
Enumerating objects: 47 commit 78ba84a...
Pushing to https://github.com/gianmattus-programmer/Chahinos.Ageny.git
To https://github.com/gianmattus-programmer/Chahinos.Ageny.git
 * [new branch]      main -> main
Branch 'main' set up to track remote branch 'main' from 'origin'.
```

Luego ve a: https://github.com/gianmattus-programmer/Chahinos.Ageny

¡Deberías ver tus cambios ahí! ✨

---

## 🆘 **TROUBLESHOOTING**

### Error: "Authentication failed"
- Verifica el token es válido: https://github.com/settings/tokens
- O usa `gh auth login` para autenticarte con GitHub CLI

### Error: "could not read Username"
```bash
# Limpia credenciales almacenadas y reintenta
git credential-manager erase https://github.com
```

### Error: "branch 'master' does not exist"
Usa `main` en lugar de `master`:
```bash
git push -u origin main
```

---

## 📞 **¿Necesitas ayuda?**

Si algo no funciona:
1. Verifica tu URL de repositorio es correcta
2. Asegúrate de tener credenciales configuradas
3. Intenta con `git push -v` para ver más detalles
