#!/bin/bash

# Instala dependencias Python
pip install -r requirements.txt

# Instala navegadores Playwright sin root
playwright install --with-deps
