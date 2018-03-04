# Writeup Howto create Torrent container
## Requirements
* lxd
* openvpn
* deluged and deluge-web
* optional nginx

1. Create and enter server using:
```
lxc launch ubuntu [servername]
lxc exec [servername] -- sudo --login --user ubuntu
```
2. Install and start needed software on container
```
sudo apt-get install openvpn deluged deluge-web
sudo openvpn --config [your-config] --daemon
deluged
deluged-web &
```
3. (with nginx) Now exit container and change config for /etc/nginx/sites-available/[default or other (I use default here... lazy)] and possibly same for /etc/nginx/sites-enabled/[default or other config] on the host computer. I use this super-simple config, cant garantee its safe only uses this locally.
```
server {
  listen 80 default_server; #IPv4
  listen [::]:80 ssl default_server; #IPv6?

  server_name [server-ip/server-domain-name];
  location / {
    proxy_pass http://server-ip:port;
    proxy_http_version 1.1
  }
}
```
This should be sufficient... I think.
Just restart nginx:
```
service nginx restart
```
3. (with ufw-natting) On server configure /etc/ufw/before.rules
```
*nat
:PREROUTING ACCEPT [0:0]
:POSTROUTING ACCEPT [0:0]

-A PREROUTING -i eth0 -p tcp --dport 8112 -j DNAT --to-destination 10.43.33.142

-A POSTROUTING -s {container-ip/prefix} -o {outinterface} -j MASQUERADE

COMMIT
```
On the container add the ip-route to your local network to bypass vpn:
```
ip route add [homenetwork/prefix] via  {default-gateway of container network} dev eth0
```
