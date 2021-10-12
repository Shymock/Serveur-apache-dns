apt-get update -y
apt-get upgrade -y
apt-get install bind9 -y

cd /etc
rm host.conf
rm resolv.conf
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/host.conf
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/resolv.conf
cd bind/
rm named.conf.local
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/db.gsb.lan
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/db.gsb.lan.rev
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/named.conf.local
systemctl restart bind9
