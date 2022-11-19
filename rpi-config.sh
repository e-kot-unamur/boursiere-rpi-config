#!/bin/bash
# configuration of a raspberry at his first start (needs to be run as root)

# variable to change according to your needs
user="pi" # name of your user on the raspberry (probably pi)

# ssh activation
raspi-config nonint do_ssh 1

# sleep mode desactivation
raspi-config nonint do_blanking 1

# creates shortcuts to boursiere website on desktop 
cat >/home/$user/Desktop/boursiere_website.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Name=Boursiere website
Type=Link
URL=https://boursiere.e-kot.be/
Icon=text-html
EOF

# installs firefox
apt-get install -y firefox-esr firefox-esr-l10n-fr
