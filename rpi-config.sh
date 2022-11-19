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
if ! id $user 1> /dev/null 2>&1 ; then
    echo "User $user does not exist. You have to specify an existing user name (the name of your personal user on the raspberry, configured at its first start) using the 'u' parameter."
    echo "Example: $0 -u pi"
    exit 1
fi

# ssh activation
raspi-config nonint do_ssh 0 && echo "ssh activated"

# sleep mode deactivation
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

# restart the raspberry to apply changes
shutdown -r now