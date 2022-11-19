#!/bin/bash
# configuration of a raspberry at his first start (needs to be run as root)

# variable to change according to your needs
user="pi" # name of your user on the raspberry (probably pi)

# ssh activation
raspi-config nonint do_ssh 0 && echo "ssh activated"

# sleep mode desactivation
raspi-config nonint do_blanking 1 && echo "sleep mode desactivated"

# installs firefox
apt-get install -y firefox-esr firefox-esr-l10n-fr

# creates shortcuts to boursiere website on desktop 
cat >/home/$user/Desktop/prices_FS.desktop <<EOF && echo "shortcuts to boursiere website (prices) created"
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Prices FS
Type=Application
Terminal=False
Exec=firefox-esr https://boursiere.e-kot.be/ --kiosk
Icon=/usr/share/firefox-esr/browser/chrome/icons/default/default16.png
EOF

cat >/home/$user/Desktop/order.desktop <<EOF && echo "shortcuts to boursiere website (order) created"
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Order
Type=Application
Terminal=False
Exec=firefox-esr https://boursiere.e-kot.be/order.html
Icon=/usr/share/firefox-esr/browser/chrome/icons/default/default16.png
EOF

shutdown -r now