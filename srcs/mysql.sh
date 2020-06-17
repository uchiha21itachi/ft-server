# Download and Install the Latest Updates for the OS
apt-get update && apt-get upgrade -y

#installing ufw
# apt-get install -y ufw  

# Enable Ubuntu Firewall and allow SSH & MySQL Ports
ufw enable
ufw allow 22
ufw allow 3306

# Install essential packages
apt-get -y install zsh htop

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
debconf-set-selections <<< 'mysql-server mysql-server/root_password password your_password'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password your_password'
apt-get -y install mysql-server

# Run the MySQL Secure Installation wizard
mysql_secure_installation

sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
mysql -uroot -p -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; FLUSH PRIVILEGES;'

service mysql restart

