# boursiere-rpi-config
## Installation
To install the script, you need to do this command in the folder where you want to place it.
```sh
sudo -i # If you decide to install it as root
cd /home/pi # In my example here, I install it in the user's home pi but do as you wish
git clone https://github.com/e-kot-unamur/boursiere-rpi-config.git
```
## Use
First of all, if you are not under root, do it:
```sh
sudo -i
```
Then, go to the folder you just installed:
```sh
cd /home/pi/boursiere-rpi-config # The project is here in my example but it can vary depending on your installation
```
Then you have to modify the `user` variable on line 5, according to the name of your user on your raspberry.
If you need to make changes, you can make them like this:
```sh
nano ./rpi-config.sh
```
Then, make sure you have a Wifi connection, after which you can run the script like this:
```
./rpi-config.sh
```
Now the raspberry is correctly configured.
