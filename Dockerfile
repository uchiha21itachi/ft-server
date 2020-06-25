FROM debian:buster

# ENV DEBIAN_FRONTEND noninteractive

#Installing nginx
RUN apt-get -y update &&  echo apt-get -y upgrade \
        && apt-get install -y nginx && echo "Nginx install done" \
            && apt-get clean && echo "clean done" \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 


#installing Curl
RUN apt-get update \
	    && apt-get install curl -y\
	        && apt-get clean \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 


#installing wget
RUN apt-get update \
	    && apt-get install wget -y \
	        && apt-get clean \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 

#installing PHP
RUN apt-get -y update  && echo "update before php install : Done" \
        && apt-get install -y php-fpm php-common php-mbstring php-xmlrpc php-soap php-gd php-xml php-intl php-mysql php-cli php-ldap php-zip php-curl \
            && apt-get clean && echo "clean done" \
                && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 


#Changing permission and running script to install mysql
COPY ./srcs/mariadb.sh .
RUN chmod 777 mariadb.sh
RUN ./mariadb.sh

#Creating required folders
RUN mkdir /var/www/wordpress /var/www/phpmyadmin


RUN pwd
COPY ./srcs/config.inc.php /var/www/phpmyadmin

#Copying the configuration file for nginx from repo
COPY ./srcs/wordpress.conf /etc/nginx/sites-avaiable/

#Creating symbolic link from new server block conf file and unlinking the default
WORKDIR /etc/nginx/sites-enabled
RUN rm *
RUN ln -s /etc/nginx/sites-available/sample.com /etc/nginx/sites-enabled/
RUN nginx -t


#installing PhpMyAdmin
RUN echo "Installing phpmyadmin"
WORKDIR /var/www/phpmyadmin/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.0.1-all-languages/* .
RUN rm -rf phpMyAdmin-4.9.0.1-all-languages
RUN rm config.sample.inc.php
#copying Config files


#Installing worpress
WORKDIR /var/www/wordpress/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN mv wordpress/* .
RUN rm -rf wordpress

#Copying the config file in wordpress
RUN echo "copying wp-config.php"
COPY ./srcs/    wp-config.php /var/www/wordpress

#Giving permission to www-data group (Ngnix and Php run as www-data)
WORKDIR /var/www/wordpress
RUN chown -R www-data:www-data *
RUN chmod -R 755 *

RUN nginx -t

COPY ./srcs/start.sh .
RUN chmod 777 ./start.sh

EXPOSE 80
EXPOSE 443

CMD bash start.sh && tail -f /dev/null