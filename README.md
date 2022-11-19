# boursiere-rpi-config
## Installation
To install the script, you need to do this command in the folder where you want to place it.
```sh
sudo -i # If you decide to install it as root
git clone https://github.com/e-kot-unamur/boursiere-rpi-config.git # In this example, we install it in the current directory (/root/)
```
## Use
First of all, if you are not under root, do it:
```sh
sudo -i
```
Then, go to the folder you just installed:
```sh
cd /root/boursiere-rpi-config # The project is here in my example but it can vary depending on your installation
```
Then you have to modify the `user` variable on [line 5](https://github.com/e-kot-unamur/boursiere-rpi-config/blob/a3abb5117f5ac043bc5c1c877b36da01a3224c3c/rpi-config.sh#L5), according to the name of your user on your raspberry (configured at first startup).
If you need to make changes, you can make them like this:
```sh
nano ./rpi-config.sh # This will open the script in an interactive text editor
```
Then, make sure you have a Wifi connection, after which you can run the script like this:
```sh
./rpi-config.sh
```
Now the raspberry restarts and is correctly configured.
## Possible errors
### Error: "firefox did not install correctly"
This error is probably due to the fact that `apt` is not up to date. Do this command (as `root`):
```sh
apt update && apt -y upgrade
```
Then, you can run the script again.
