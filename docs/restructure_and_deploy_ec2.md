# Reestructuración y Despliegue de GestionCitasMedicas en EC2

Esta guía describe cómo reestructurar, automatizar y desplegar el proyecto **GestionCitasMedicas** en una instancia EC2 de AWS, siguiendo buenas prácticas de portabilidad y automatización.

---

## 1. Estructura Recomendada

```
GestionCitasMedicas/
├── README.md
├── build.xml
├── src/
│   └── main/
│       ├── java/
│       └── webapp/
├── lib/
│   └── dotenv-java-2.2.4.jar
├── dist/
├── build/
├── scripts/
│   ├── setup.sh
│   └── start.sh
├── CitasMedicasBase.sql
├── .env.example
└── .env
```

---

## 2. Automatización de Dependencias y Compilación

- El script `scripts/setup.sh` instala dependencias del sistema, descarga el JAR de dotenv-java si no existe, copia `.env.example` a `.env` si es necesario y compila el proyecto.
- El script `scripts/start.sh` despliega el WAR en Tomcat y reinicia el servicio.

---

## 3. Variables de Entorno

- El archivo `.env.example` proporciona una plantilla para la configuración de la base de datos.
- El archivo `.env` debe contener los valores reales y estar en la raíz del proyecto.

---

## 4. Clase de Conexión a Base de Datos

- La clase `ConexionBD` usa dotenv-java para leer la configuración desde `.env`.

---

## 5. build.xml

- Incluye todos los JAR de `lib/` en el classpath para compilación y empaquetado.
- Usa la estructura moderna de carpetas.

---

## 6. Despliegue

- Ejecuta `./scripts/setup.sh` para instalar dependencias y compilar.
- Ejecuta `./scripts/start.sh` para desplegar en Tomcat.

---

## 7. Recomendaciones

- No subas el archivo `.env` real a tu repositorio.
- Asegúrate de que Tomcat esté instalado en `/opt/tomcat` o ajusta el script.
- Puedes personalizar los scripts según tus necesidades.

---

## 8. Comandos Rápidos

```bash
git clone <repo>
cd GestionCitasMedicas
cp .env.example .env
# Edita .env con tus credenciales
./scripts/setup.sh
./scripts/start.sh
```