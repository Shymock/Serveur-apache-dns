apt update -y
apt install apache2 libapache2-mod-php -y
apt install apache2 -y
apt install mariadb-server -y
apt install php-mysql -y
apt install mariadb-server -y
mysql_secure_installation
cd /var/www/html/
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsbfrais.html
cd /etc/apache2/sites-available/
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais.conf
cd /
mysql -u root -p
CREATE DATABASE gsb_frais;
CREATE USER 'gsb'@'localhost' IDENTIFIED BY 'gsbpass';
GRANT ALL PRIVILEGES ON * TO 'gsb'@'localhost';
flush privileges;
cd /home/serrurier/
wget https://github.com/Shymock/Serveur-apache-dns/blob/main/gsb_frais.tar.gz?raw=true
tar -xzvf gestion_frais.tar.gz
cp -r gsb_frais /var/www
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais_structure.sql
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais_insert_tables_statiques.sql
cd /var/www/sites-available/
a2dissite 000-default.conf
a2ensite gsb_frais.conf
systemctl restart apache2