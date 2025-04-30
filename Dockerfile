FROM tomcat:9.0-jdk17

# Elimina la aplicación por defecto
RUN rm -rf /usr/local/tomcat/webapps/*


# Define el puerto (Render usará este valor automáticamente)
ENV PORT=8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
