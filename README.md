# boursiere-rpi-config
## Installation
To install the script, you need to do this command in the folder where you want to place it.
```sh
sudo -i # If you decide to install it as root
git clone https://github.com/e-kot-unamur/boursiere-rpi-config.git # In this example, we install it in the current directory (/root/)
```
## Use
### Preparation
First of all, if you are not under root, do it:
```sh
sudo -i
```
Then, go to the folder you just installed:
```sh
cd /root/boursiere-rpi-config # The project is here in my example but it can vary depending on your installation
```
Then, make sure you have a Wifi connection, after which you can run the script.
There are two possibilities:
### 1. User=pi
Your personal user on your raspberry is called `pi`, in this case you can simply run the script like this:
```sh
./rpi-config.sh
```
### 2. User=other
Your personal user on your raspberry is not called `pi`, in this case you can run the script like this:
```sh
./rpi-config.sh -u your_user
```
### Script ended successfully
Now the raspberry restarts and is correctly configured.
## Possible errors
### Error: firefox did not install correctly
This error is probably due to the fact that `apt` is not up to date.
Do this command (as `root`):
```sh
apt update && apt -y upgrade
```
Then, you can run the script again.
### Other errors
Don't hesitate to display the help message if you can't use the script.
You can display it this way:
```sh
./rpi-config.sh -h
```
