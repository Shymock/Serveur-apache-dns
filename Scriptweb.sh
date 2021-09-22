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
cp -r gsb_frais /var/www
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais_structure.sql
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais_insert_tables_statiques.sql
cd /etc/apache2/sites-available/
a2dissite 000-default.conf
a2ensite gsb_frais.conf
systemctl restart apache2
