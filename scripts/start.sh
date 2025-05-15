#!/bin/bash
set -e

# Configuración
TOMCAT_WEBAPPS="/opt/tomcat/webapps"
WAR_FILE="dist/citasMedicas.war"
APP_NAME="citasMedicas"

# Colores para mensajes
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Verificar si el archivo WAR existe
if [ ! -f "$WAR_FILE" ]; then
  echo -e "${RED}Error: El archivo WAR no existe. Ejecuta primero setup.sh${NC}"
  exit 1
fi

echo -e "${GREEN}== Verificando si Tomcat está en ejecución ==${NC}"
if ! systemctl is-active --quiet tomcat; then
  echo -e "${RED}Tomcat no está en ejecución. Iniciando servicio...${NC}"
  sudo systemctl start tomcat
  sleep 5
fi

echo -e "${GREEN}== Eliminando despliegue anterior (si existe) ==${NC}"
if [ -f "$TOMCAT_WEBAPPS/$APP_NAME.war" ]; then
  sudo rm -f "$TOMCAT_WEBAPPS/$APP_NAME.war"
fi
if [ -d "$TOMCAT_WEBAPPS/$APP_NAME" ]; then
  sudo rm -rf "$TOMCAT_WEBAPPS/$APP_NAME"
fi

echo -e "${GREEN}== Copiando WAR a Tomcat ==${NC}"
sudo cp "$WAR_FILE" "$TOMCAT_WEBAPPS/"

echo -e "${GREEN}== Reiniciando Tomcat ==${NC}"
sudo systemctl restart tomcat

# Esperar a que Tomcat se inicie completamente
echo -e "${GREEN}== Esperando a que Tomcat se inicie (30s) ==${NC}"
sleep 30

# Verificar que la aplicación se haya desplegado correctamente
if [ -d "$TOMCAT_WEBAPPS/$APP_NAME" ]; then
  echo -e "${GREEN}== Despliegue completado exitosamente ==${NC}"
  echo -e "${GREEN}La aplicación está disponible en: http://$(curl -s http://169.254.169.254/latest/meta-data/public-hostname):8080/$APP_NAME${NC}"
else
  echo -e "${RED}== Error en el despliegue. Revisa los logs de Tomcat ==${NC}"
  echo -e "${RED}Puedes ver los logs con: sudo tail -f /opt/tomcat/logs/catalina.out${NC}"
  exit 1
fi
