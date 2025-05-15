# Plan de Reestructuración del Proyecto

## 1. Estructura de Carpetas

Organiza tu proyecto así:

```
GestionCitasMedicas/
├── README.md
├── build.xml
├── src/
│   └── main/
│       ├── java/
│       └── webapp/
├── lib/
├── dist/
├── build/
├── scripts/
│   ├── setup.sh
│   └── start.sh
├── CitasMedicasBase.sql
└── .env.example
```

## 2. Pasos para la Migración

1. **Mover código fuente:**
   - Mueve todo el código Java a `src/main/java/`.
   - Mueve los archivos JSP, CSS, JS, imágenes y `WEB-INF` a `src/main/webapp/`.

2. **Actualizar build.xml:**
   - Asegúrate de que las rutas de `src.dir` y `web.dir` sean:
     - `src.dir = src/main/java`
     - `web.dir = src/main/webapp`

3. **Crear carpeta scripts y archivos:**
   - Crea `scripts/setup.sh` y `scripts/start.sh` (ver ejemplos abajo).

4. **Agregar archivo .env.example:**
   - Proporciona un ejemplo de configuración para la base de datos.

5. **Mover librerías externas:**
   - Coloca los `.jar` en la carpeta `lib/`.

6. **Actualizar README.md:**
   - Incluye instrucciones para clonar, configurar y desplegar.

7. **Verifica que el proyecto compile y genere el WAR correctamente.**

## 3. Ejemplo de scripts y archivos

Ver archivos siguientes.