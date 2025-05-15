# Gestión de Citas Médicas

Aplicación web desarrollada en Java para gestionar citas entre pacientes y médicos. Permite a los usuarios registrarse, iniciar sesión, solicitar citas, y a los administradores supervisar el sistema.

## 🛠 Tecnologías Utilizadas

- **Java EE** (Servlets y JSP)
- **MySQL** (Base de datos relacional)
- **Apache Tomcat** (Servidor de aplicaciones)
- **JDBC** (`mysql-connector-j-9.2.0.jar`)
- **Apache Ant** (`build.xml`) para construcción
- **dotenv-java** para gestión de variables de entorno
- **HTML/CSS/JS** para la interfaz

## 📁 Estructura del Proyecto

```
GestionCitasMedicas/
├── README.md
├── build.xml                # Script de construcción con Ant
├── src/
│   └── main/
│       ├── java/           # Código fuente Java (Servlets, SQL)
│       └── webapp/         # Archivos web (JSP, CSS, JS, imágenes)
├── lib/
│   ├── mysql-connector-j-9.2.0.jar  # Driver JDBC
│   └── dotenv-java-2.2.4.jar        # Gestión de variables de entorno
├── dist/                   # Archivos generados para distribución
├── build/                  # Archivos temporales de compilación
├── scripts/
│   ├── setup.sh            # Script de configuración inicial
│   └── start.sh            # Script para iniciar la aplicación
├── CitasMedicasBase.sql    # Script para crear la base de datos
├── .env.example            # Plantilla para variables de entorno
└── .env                    # Variables de entorno (no incluido en git)
```

## ✅ Requisitos

- JDK 8 o superior
- Apache Tomcat 9+
- MySQL Server
- Ant (para compilar con `build.xml`)

## 🚀 Instalación y Despliegue

### Despliegue Local

1. **Base de datos**  
   Ejecuta el script `CitasMedicasBase.sql` en tu servidor MySQL para crear las tablas necesarias.

2. **Configuración de entorno**  
   Copia `.env.example` a `.env` y edita con tus credenciales de MySQL.

3. **Compilar y desplegar**  
   Usa Ant para compilar el proyecto:
   ```bash
   ant build
   ```
   
   Despliega el WAR generado en tu servidor Tomcat local.

### Despliegue en Amazon EC2

1. **Clona el repositorio:**
   ```bash
   git clone <repo>
   cd GestionCitasMedicas
   ```

2. **Configura la base de datos:**
   - Ejecuta `CitasMedicasBase.sql` en tu servidor MySQL.
   - Copia `.env.example` a `.env` y edita tus credenciales.

3. **Instala dependencias y compila:**
   ```bash
   ./scripts/setup.sh
   ```

4. **Despliega en Tomcat:**
   ```bash
   ./scripts/start.sh
   ```

5. **Accede a la aplicación:**
   - Ve a `http://<EC2_PUBLIC_IP>:8080/citasMedicas/`

**Notas para EC2:**
- Asegúrate de que Tomcat esté instalado en `/opt/tomcat`.
- Modifica los scripts si tu ruta de Tomcat es diferente.
- Configura los grupos de seguridad para permitir tráfico en el puerto 8080.

## 👤 Roles de Usuario

- **Paciente**: Registro, inicio de sesión, solicitud y consulta de citas.
- **Médico**: Visualización de citas asignadas.
- **Administrador**: Gestión de usuarios y sistema.

## 📄 Principales JSPs

- `login.jsp`: Inicio de sesión
- `altaUsuario.jsp`: Registro de usuarios
- `menu.jsp`: Menú principal
- `citas.jsp`: Gestión de citas
- `admin.jsp`: Panel administrativo

## 🔒 Seguridad

- Validación de formularios del lado del cliente y servidor.
- Control de acceso mediante sesiones.
- Variables de entorno para credenciales sensibles.

## 📋 Mantenimiento

- Para actualizar la aplicación en EC2:
  ```bash
  git pull
  ./scripts/setup.sh
  ./scripts/start.sh
  ```

- Para reiniciar solo Tomcat:
  ```bash
  sudo systemctl restart tomcat
  ```

Repositorio gestionado con Git.

---

> Para dudas o mejoras, siéntete libre de abrir un issue o pull request.
