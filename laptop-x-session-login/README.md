1. Create functioning ssh connection to the computer(server) on which you wish to start the X-Session on. (I use a identity file with no password, as this work well for my usecase.)
2. On the server install x11vnc, if using ubuntu:
```
sudo apt-get install x11vnc
```
To be able to log in you have to give the vnc-server access to the login-file. To access the login-screen you must give x11vnc an auth-file. ArchWiki has a good walkthrough with many different GUIs. https://wiki.archlinux.org/index.php/x11vnc

To run the server use the following command but exchange the auth-part to fit your OS:
```
sudo x11vnc -display :0 -auth /var/run/lightdm/root/:0
```
To use the server over ssh-tunnel create a tunnel and start the server using either this:
```
ssh -L localhost:5900:localhost:5900 <ssh-server>
sudo x11vnc -display :0 -auth /var/run/lightdm/root/:0
```
or
```
ssh -L localhost:5900:localhost:5900 -t <ssh-server> 'sudo x11vnc -display :0 -auth /var/run/lightdm/root/:0 -localhost'
```
To connect to the server you simply start a vncviewer like remmina or lightvnc and connect to **localhost:5900**
