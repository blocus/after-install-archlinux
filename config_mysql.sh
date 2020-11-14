sudo rm -fr /var/mysql /var/lib/mysql /var/log/mysql
sudo mkdir -p /var/mysql /var/lib/mysql /var/log/mysql
sudo chown -R mysql:mysql /var/mysql /var/lib/mysql /var/log/mysql
sudo bash -c "cd /var/lib ; mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql"

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/

sudo mysql_secure_installation