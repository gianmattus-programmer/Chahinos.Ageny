// Deshabilitar clic derecho en todo el sitio
document.addEventListener("contextmenu", function(event) {
    event.preventDefault();  // Bloquea el menú contextual
});

// Deshabilitar la selección de texto en el sitio
document.body.style.userSelect = "none";
document.body.style.webkitUserSelect = "none";  // Para Webkit (Chrome, Safari)
document.body.style.mozUserSelect = "none";    // Para Firefox
document.body.style.msUserSelect = "none";     // Para IE/Edge

// Deshabilitar el arrastre de imágenes
document.querySelectorAll("img").forEach(function(img) {
    img.setAttribute("draggable", "false");
});

// Bloquear combinaciones de teclas comunes para inspeccionar el código
document.addEventListener("keydown", function(e) {
    // Bloquea F12, Ctrl + U (Ver fuente), Ctrl + Shift + I (Inspeccionar)
    if (
        e.key === "F12" ||
        (e.ctrlKey && e.key.toLowerCase() === "u") ||
        (e.ctrlKey && e.shiftKey && e.key.toLowerCase() === "i") ||
        (e.ctrlKey && e.shiftKey && e.key.toLowerCase() === "j") ||
        (e.ctrlKey && e.shiftKey && e.key.toLowerCase() === "c")
    ) {
        e.preventDefault();  // Bloquea la acción
    }
});

// Bloquear el copiar texto de la página
document.addEventListener("copy", function(e) {
    e.preventDefault();  // Bloquea la acción de copiar
});

// Bloquear el cortar texto
document.addEventListener("cut", function(e) {
    e.preventDefault();  // Bloquea la acción de cortar
});

// Bloquear el pegar texto
document.addEventListener("paste", function(e) {
    e.preventDefault();  // Bloquea la acción de pegar
});

// Detectar cuando se abre las herramientas de desarrollo (DevTools)
let devtools = /./;
devtools.toString = function () {
    window.location.href = "https://chahinos.com";  // Redirige a la página de inicio si las DevTools están abiertas
};

console.log('%c', devtools);

// Bloquear la consola del navegador
Object.defineProperty(console, 'log', { value: function() {} });
Object.defineProperty(console, 'warn', { value: function() {} });
Object.defineProperty(console, 'error', { value: function() {} });

document.addEventListener("keydown", function(e) {
    // Bloquear Ctrl + A (Seleccionar todo)
    if (e.ctrlKey && e.key === 'a') {
        e.preventDefault();
    }

    // Bloquear Ctrl + C (Copiar)
    if (e.ctrlKey && e.key === 'c') {
        e.preventDefault();
    }

    // Bloquear Ctrl + V (Pegar)
    if (e.ctrlKey && e.key === 'v') {
        e.preventDefault();
    }

    // Bloquear Ctrl + X (Cortar)
    if (e.ctrlKey && e.key === 'x') {
        e.preventDefault();
    }

    // Bloquear Ctrl + S (Guardar)
    if (e.ctrlKey && e.key === 's') {
        e.preventDefault();
    }

    // Bloquear Ctrl + U (Ver código fuente)
    if (e.ctrlKey && e.key === 'u') {
        e.preventDefault();
    }

    // Bloquear Ctrl + Shift + I (Abrir las herramientas de desarrollo)
    if (e.ctrlKey && e.shiftKey && e.key === 'i') {
        e.preventDefault();
    }

    // Bloquear Ctrl + Shift + J (Abrir la consola)
    if (e.ctrlKey && e.shiftKey && e.key === 'j') {
        e.preventDefault();
    }

    // Bloquear F12 (Abrir herramientas de desarrollo)
    if (e.key === 'F12') {
        e.preventDefault();
    }
});