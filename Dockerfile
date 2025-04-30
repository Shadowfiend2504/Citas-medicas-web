FROM tomcat:9.0-jdk17

# Elimina la aplicación por defecto
RUN rm -rf /usr/local/tomcat/webapps/*

# Copia tu archivo WAR como la app principal
COPY CitasMedicasWeb.war /usr/local/tomcat/webapps/ROOT.war

# Define el puerto (Render usará este valor automáticamente)
ENV PORT=8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
