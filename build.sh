#!/bin/bash

set -e  # Detiene el script ante cualquier error

echo "[*] Torghost installer v3.0"
echo "[*] Installing prerequisites..."

sudo apt-get update
sudo apt-get install -y tor python3-pip python3-venv build-essential

# Detectar versión de Python activa
PYTHON_VERSION=$(python3 -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
PYTHON_DEV_PKG="python${PYTHON_VERSION}-dev"

echo "[*] Installing Python dev headers for Python ${PYTHON_VERSION}..."
sudo apt-get install -y $PYTHON_DEV_PKG

echo "[*] Creating and activating virtual environment..."
python3 -m venv venv
source venv/bin/activate

echo "[*] Installing Python dependencies in virtualenv..."
pip install -r requirements.txt

echo "[*] Creating build directory..."
mkdir -p build
cd build

echo "[*] Compiling Python source to C with cython..."
cython3 ../torghost.py --embed -o torghost.c --verbose

echo "[*] Compiling C to binary with gcc..."
gcc -Os -I /usr/include/python${PYTHON_VERSION} -o torghost torghost.c -lpython${PYTHON_VERSION} -lpthread -lm -lutil -ldl

echo "[*] Copying binary to /usr/bin..."
sudo cp torghost /usr/bin/

echo "[✓] Installation completed successfully."
