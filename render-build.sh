#!/bin/bash

# Actualizar repositorios
apt-get update

# Instalar librerías necesarias para Playwright
apt-get install -y \
  libgtk-4-1 \
  libgraphene-1.0-0 \
  libgstreamer-gl1.0-0 \
  gstreamer1.0-libav \
  libenchant-2-2 \
  libsecret-1-0 \
  libmanette-0.2-0 \
  libgles2-mesa \
  libgstreamer-plugins-base1.0-0 \
  libgstreamer-plugins-good1.0-0

# Luego continuar con instalación de paquetes de Python y Playwright
pip install -r requirements.txt
playwright install