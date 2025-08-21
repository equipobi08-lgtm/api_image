#!/usr/bin/env bash

# Instalar dependencias del sistema necesarias para Playwright
apt-get update && apt-get install -y \
  wget \
  libnss3 \
  libxss1 \
  libasound2 \
  libatk1.0-0 \
  libatk-bridge2.0-0 \
  libcups2 \
  libdbus-1-3 \
  libdrm2 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  libgbm1 \
  libgtk-3-0 \
  libglib2.0-0 \
  libx11-xcb1 \
  libxshmfence1 \
  libxext6 \
  libxi6 \
  libxtst6 \
  libpangocairo-1.0-0 \
  libpango-1.0-0 \
  fonts-liberation \
  libappindicator3-1 \
  libsecret-1-0 \
  libwayland-client0 \
  libwayland-egl1 \
  libxinerama1 \
  libxcursor1

# Instalar dependencias de Python
pip install -r requirements.txt

# Instalar navegadores de Playwright
python -m playwright install --with-deps
