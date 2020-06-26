
echo " HELLOO WORLDDDDDD  "

service mysql start

mysql -e "CREATE DATABASE WordPress"

mysql -e "GRANT ALL ON WordPress.* TO WordPressUser @'localhost' IDENTIFIED BY 'admin1234'";

mysql -e "FLUSH PRIVILEGES";

service mysql start
service php7.3-fpm start
service nginx start

echo "hello"

echo "infine loop"

read

echo "yes"