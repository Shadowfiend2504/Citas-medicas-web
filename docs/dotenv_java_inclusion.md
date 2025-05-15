# Incluir dotenv-java en el proyecto

1. Descarga el JAR de dotenv-java:
    ```bash
    mkdir -p lib
    wget -O lib/dotenv-java-2.2.4.jar https://repo1.maven.org/maven2/io/github/cdimascio/dotenv-java/2.2.4/dotenv-java-2.2.4.jar
    ```

2. Verifica la estructura del proyecto:
    ```
    GestionCitasMedicas/
    ├── build.xml
    ├── lib/
    │   └── dotenv-java-2.2.4.jar
    ├── src/
    │   └── main/
    │       └── java/
    │           └── SQL/
    │               └── ConexionBD.java
    ├── .env
    ...
    ```

3. Asegúrate de que tu `build.xml` incluya:
    ```xml
    <path id="project.classpath">
        <fileset dir="${lib.dir}" includes="**/*.jar"/>
    </path>
    ```

4. Compila el proyecto:
    ```bash
    ant clean dist
    ```

5. ¡Listo! Tu proyecto ahora puede leer variables de entorno desde `.env` usando dotenv-java.