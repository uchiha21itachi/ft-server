FROM debian:buster

ENV DEBIAN_FRONTEND noninteractive

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


COPY ./srcs/wordpress.conf /etc/nginx/sites-avaiable/
# COPY ./srcs/start.sh .
COPY ./srcs/mariadb.sh .

# RUN chmod 777 ./start.sh
RUN chmod 777 mariadb.sh
RUN ./mariadb.sh

WORKDIR /var/www/wordpress/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -zxvf latest.tar.gz
RUN mv wordpress/* .
RUN rm -rf wordpress

RUN echo "copying wp-config.php"
# RUN cp /wp-config.php /var/www/wordpress


WORKDIR /var/www/wordpress
RUN chown -R www-data:www-data *
RUN chmod -R 755 *

COPY ./srcs/start.sh .
RUN chmod 777 ./start.sh

EXPOSE 80
EXPOSE 443

CMD bash start.sh && tail -f /dev/null