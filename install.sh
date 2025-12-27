#!/bin/bash

# Capta o diretório atual e onde o script foi executado.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
USER_APPS_DIR="$HOME/.local/share/applications"

# Mensagem de instalação.
echo " Instalando Python WhatsApp GTK. . . "
echo " Diretório do projeto detectado: $DIR "

# Dá permissão de execução para o main.py
chmod +x "$DIR/main.py"

# Cria o arquivo WhatsApp.desktop.
cat <<FIM > "$DIR/whatsapp.desktop"
[Desktop Entry]
Name=WhatsApp
Comment=Cliente simples para o WhatsApp Web
Exec=$DIR/main.py
Icon=$DIR/assets/icon.png
Type=Application
Categories=Network;Chat;
Terminal=false
StartupNotify=true
FIM

# Move o arquivo para a pasta de aplicativos do usuário.
mv "$DIR/whatsapp.desktop" "$USER_APPS_DIR/"

echo "Instalação concluida!"