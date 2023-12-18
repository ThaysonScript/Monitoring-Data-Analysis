#!/usr/bin/env bash

# Verifica se o script está sendo executado como root
if [[ $(id -u) -ne 0 ]]; then
    echo "Este script precisa ser executado como root. Por favor, execute-o com sudo."
    exit 1
fi

# Verifica se o Python 3 está instalado e instala se não estiver
if ! which python3 > /dev/null; then
    apt install python3
fi

# Verifica se o pip está instalado e instala se não estiver
if ! which pip > /dev/null; then
    apt install python3-pip
fi

# Instala o python3-venv
apt install python3-venv

# Cria o ambiente virtual
python3 -m venv package_modules

# Ativa o ambiente virtual
source package_modules/bin/activate

# Instala os pacotes no ambiente virtual
pip install matplotlib pandas scipy scikit-learn

# Move a pasta src/ para o ambiente virtual
mv src/ package_modules/