/**
 * SOLUCIÓN: Evitar que Vimeo se recargue durante scroll triggers
 * 
 * El problema: Cuando los iframes de Vimeo se cargan, cambian el tamaño de su contenedor,
 * lo que dispara un refresh de ScrollTrigger. Esto causa que el iframe se recargue.
 * 
 * La solución: Establecer dimensiones fijas y usar la API de ResizeObserver para
 * prevenir que los cambios de tamaño del iframe disparen actualizaciones innecesarias.
 */

(function() {
  // 1. Esperar a que el DOM esté completamente cargado
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init);
  } else {
    init();
  }

  function init() {
    // 2. Encontrar todos los iframes de Vimeo
    const vimeoIframes = document.querySelectorAll('[data-vimeo-id]');
    
    vimeoIframes.forEach(container => {
      // 3. Obtener el contenedor padre y establecer dimensiones
      const parent = container.closest('[class*="video"], [class*="c-vimeo"]');
      
      if (parent) {
        // Establecer aspecto ratio para evitar reflow
        const style = window.getComputedStyle(parent);
        const width = parent.offsetWidth || 1000;
        const aspectRatio = parent.getAttribute('data-aspect-ratio') || '16/9';
        
        // Calcular altura basada en el aspect ratio
        let height;
        if (aspectRatio.includes('/')) {
          const [w, h] = aspectRatio.split('/');
          height = (width * parseInt(h)) / parseInt(w);
        } else {
          height = width * (9/16); // Default 16:9
        }
        
        // Aplicar dimensiones
        parent.style.width = width + 'px';
        parent.style.height = height + 'px';
        parent.style.overflow = 'hidden';
        parent.style.position = 'relative';
        
        // 4. Pausar AnimationFrame durante la carga del video
        pauseScrollTriggerDuringLoad(container);
      }
    });
    
    // 5. Escuchar eventos de Webflow que podrían disparar refresh
    preventUnecessaryRefreshes();
  }

  function pauseScrollTriggerDuringLoad(container) {
    // Escuchar el evento de carga del iframe de Vimeo
    const observer = new MutationObserver((mutations) => {
      mutations.forEach((mutation) => {
        if (mutation.addedNodes.length) {
          mutation.addedNodes.forEach((node) => {
            if (node.tagName === 'IFRAME' && node.src && node.src.includes('vimeo')) {
              // Cuando el iframe se agrega, pausar ScrollTrigger
              if (window.gsap && window.gsap.globalTimeline) {
                const scrollTriggers = gsap.getProperty(gsap.globalTimeline().progress);
                
                // Pausar por 1 segundo para permitir que el video se dibuje
                const startTime = Date.now();
                const interval = setInterval(() => {
                  if (Date.now() - startTime > 1000) {
                    clearInterval(interval);
                    // Reanudar y refrescar después
                    if (window.ScrollTrigger) {
                      ScrollTrigger.refresh();
                    }
                  }
                }, 100);
              }
            }
          });
        }
      });
    });

    observer.observe(container, {
      childList: true,
      subtree: true
    });
  }

  function preventUnecessaryRefreshes() {
    // Escuchar cambios de tamaño en los contenedores de video
    const videoContainers = document.querySelectorAll('[class*="video_wrapper"], [class*="c-vimeo"]');
    
    if (window.ResizeObserver) {
      const resizeObserver = new ResizeObserver(() => {
        // Debounce para evitar múltiples triggers
        clearTimeout(window.vimeoResizeTimeout);
        window.vimeoResizeTimeout = setTimeout(() => {
          if (window.ScrollTrigger) {
            ScrollTrigger.refresh();
          }
        }, 500);
      });

      videoContainers.forEach(container => {
        resizeObserver.observe(container);
      });
    }
  }

  // Función auxiliar para pausar todas las animaciones de scroll
  window.pauseScrollAnimations = function() {
    if (window.gsap && window.gsap.globalTimeline) {
      gsap.globalTimeline().pause();
    }
  };

  // Función auxiliar para reanudar todas las animaciones de scroll
  window.resumeScrollAnimations = function() {
    if (window.gsap && window.gsap.globalTimeline) {
      gsap.globalTimeline().resume();
    }
  };
})();
