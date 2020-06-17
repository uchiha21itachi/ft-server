echo " Installing Maria DB"

#Mentioning the required version of MariaDB..
MARIADB_VERSION='10.1'


#Installing gnupg2...

apt-get update
apt-get install -y gnupg2


#Installing apt-add-repository
apt-get -y install software-properties-common && apt-get -y update 

#Adding Repository Key...
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db


#Adding Repository...
apt-add-repository "deb [arch=amd64,i386] http://mirrors.accretive-networks.net/mariadb/repo/$MARIADB_VERSION/ubuntu trusty main"


#Updating 
apt-get -y update && apt-get -y upgrade


#Installing mariadb...
apt-get install -qq mariadb-server
