#!/bin/bash
set -e

echo "== Instalando dependencias base (Java, Ant, MySQL client) =="
sudo apt-get update
sudo apt-get install -y openjdk-11-jdk ant mysql-client unzip wget

echo "== Descargando dotenv-java si no existe =="
DOTENV_JAR="lib/dotenv-java-2.2.4.jar"
if [ ! -f "$DOTENV_JAR" ]; then
  mkdir -p lib
  wget -O "$DOTENV_JAR" https://repo1.maven.org/maven2/io/github/cdimascio/dotenv-java/2.2.4/dotenv-java-2.2.4.jar
fi

echo "== Copiando archivo de entorno =="
if [ ! -f .env ]; then
  cp .env.example .env
  echo "Recuerda editar .env con tus credenciales reales."
fi

echo "== Compilando el proyecto con Ant =="
ant clean dist

echo "== Instalación y compilación completadas =="
