# dante
https://hub.docker.com/r/n00b1k/danted  
sudo mkdir -p /opt/danted/  
sudo nano /opt/danted/danted.conf
### install
docker run -d --name danted -p 1080:1080 -v /opt/danted/danted.conf:/etc/danted.conf -v /opt/danted/passwd:/etc/dante/passwd:ro -v /opt/danted/log:/var/log/dante --cap-add=NET_ADMIN --restart unless-stopped n00b1k/danted:1.0.3
### add user
sudo htpasswd -B /docker/danted/passwd user1  
sudo htpasswd -B /docker/danted/passwd user2
### test
curl --proxy socks5h://ip:1080 --proxy-user user1:password1 https://ifconfig.co
