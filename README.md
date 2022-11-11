# boursiere-rpi-config
## Installation
To install the script, you need to do this command in the folder where you want to place it:
```sh
git clone https://github.com/e-kot-unamur/boursiere-rpi-config.git
```
## Use
First, go to the folder you just installed:
```sh
cd ./boursiere-rpi-config
```
Then you have to modify the `user` variable on line 5, according to the name of your user on your raspberry.
If you need to make changes, you can make them like this:
```sh
nano ./rpi-config.sh
```
Then, make sure you have a Wifi connection, after which you can run the script like this:
```
sudo -i
./rpi-config.sh
```
Now your computer will restart and all changes will apply.
