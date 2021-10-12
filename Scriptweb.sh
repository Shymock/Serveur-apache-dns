apt update -y
apt upgrade -y

apt install apache2 libapache2-mod-php -y

apt install apache2 -y

apt install mariadb-server -y

apt install php-mysql -y

mysql_secure_installation


cd /etc/apache2/sites-available/
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais.conf

cd /var/www/
wget https://github.com/Shymock/Serveur-apache-dns/raw/main/gsb_frais.tar.gz
tar -xzvf gsb_frais.tar.gz 

cd /home/serrurier/
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais_structure.sql
wget https://raw.githubusercontent.com/Shymock/Serveur-apache-dns/main/gsb_frais_insert_tables_statiques.sql

mysql -e "CREATE DATABASE gsb_frais;"
mysql -e "CREATE USER 'gsb'@'localhost' IDENTIFIED BY 'gsbpass';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'gsb'@'localhost';"
mysql -e "flush privileges;"
mysql -u root -p gsb_frais < /home/serrurier/gsb_frais_structure.sql

mysql -u root -p gsb_frais < /home/serrurier/gsb_frais_insert_tables_statiques.sql

cd /etc/apache2/sites-available/
a2dissite 000-default.conf
a2ensite gsb_frais.conf
systemctl restart apache2
