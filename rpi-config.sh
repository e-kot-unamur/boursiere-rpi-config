#!/bin/bash
# configuration of a raspberry at his first start (needs to be run as root)

# default user name
user="pi" # name of your user on the raspberry (probably pi)

# help function to display a message
Help()
{
    echo "Script to configure a raspberry pi for the 'boursiere' evening of the Cercle Info."
    echo
    echo "Syntax: $0 ([-u user_name|h])"
    echo
    echo "options:"
    echo "  -u user_name     Set the user name (User that you use as a personal user, which you configured at the first startup). Default : $user"
    echo "  -h               Print this Help."
    echo
}

# parse options (to get the user name)
while getopts ":hu:" opt; do
    case $opt in
        h)
            Help
            exit 0
            ;;
        u)
            user=$OPTARG
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            exit 1
            ;;
        :)
            echo "Option -$OPTARG requires an argument." >&2
            exit 1
            ;;
    esac
done

# verify that the user exists
if ! id $user 1> /dev/null 2>&1 || [ "$user" = "root" ]; then
    echo "User $user does not exist or you gave root. You have to specify an existing user name (the name of your personal user on the raspberry, configured at its first start) using the 'u' parameter."
    echo "Example: $0 -u pi"
    exit 1
fi

# ssh activation
raspi-config nonint do_ssh 0 && echo "ssh activated"

# sleep mode deactivation
raspi-config nonint do_blanking 1 && echo "sleep mode desactivated"

# installs firefox
apt-get install -y firefox-esr firefox-esr-l10n-fr &&

# creates shortcuts to boursiere website on desktop 
cat >/home/$user/Desktop/prices_FS.desktop <<EOF && echo "shortcuts to boursiere website (prices 1) created"
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Prices FS (bar 1)
Type=Application
Terminal=False
Exec=firefox-esr https://boursiere.e-kot.be/index.html#1 --kiosk
Icon=/usr/share/firefox-esr/browser/chrome/icons/default/default16.png
EOF

cat >/home/$user/Desktop/prices_FS_2.desktop <<EOF && echo "shortcuts to boursiere website (prices 2) created"
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Prices FS (bar 2)
Type=Application
Terminal=False
Exec=firefox-esr https://boursiere.e-kot.be/index.html#2 --kiosk
Icon=/usr/share/firefox-esr/browser/chrome/icons/default/default16.png
EOF

cat >/home/$user/Desktop/order_1.desktop <<EOF && echo "shortcuts to boursiere website (order 1) created"
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Order (bar 1)
Type=Application
Terminal=False
Exec=firefox-esr https://boursiere.e-kot.be/order.html#1 --kiosk
Icon=/usr/share/firefox-esr/browser/chrome/icons/default/default16.png
EOF

cat >/home/$user/Desktop/order_2.desktop <<EOF && echo "shortcuts to boursiere website (order 2) created"
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Name=Order (bar 2)
Type=Application
Terminal=False
Exec=firefox-esr https://boursiere.e-kot.be/order.html#2 --kiosk
Icon=/usr/share/firefox-esr/browser/chrome/icons/default/default16.png
EOF

# restart the raspberry to apply changes
shutdown -r now
