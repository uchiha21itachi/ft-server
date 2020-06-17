echo " HELLOO WORLDDDDDD  "

service mysql start

mysql -e "CREATE DATABASE wordpress"

mysql -e "GRANT ALL ON WordPress.* TO WordPressUser @'localhost' IDENTIFIED BY 'admin1234'";

mysql -e "FLUSH PRIVILEGES";

service mysql start
service php7.3-fpm start
service nginx start

echo "infinite loop"
 
read

# systemctl start mariadb.service
# echo "Starting MariaDB ..."
# systemctl enable mariadb.service
# echo "Enabling MariaDB ..."



# systemctl start nginx.service
# echo " Starting Nginx service---OK"

# systemctl enable nginx.service
# echo "Enabling nginx service---OK"



# echo "Creating database for Wordpress "
# mysql -e  "CREATE DATABASE WordPress CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci";

# echo "Creatind User and Password for database"
# mysql -e "GRANT ALL ON WordPress.* TO WordPressUser @'localhost' IDENTIFIED BY 'your password'";

# mysql -e "FLUSH PRIVILEGES";
# echo "ALL DONE"