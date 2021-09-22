apt update -y
apt install bind9 -y
cd /etc
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/host.conf
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/resolv.conf
cd bind/
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/db.gsb.lan
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/db.gsb.lan.rev
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/named.conf.local
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/named.conf.default-zones
systemctl restart bind9