FROM debian:buster

RUN apt -y update && apt -y upgrade
RUN apt -y install nginx 
RUN mkdir -p /var/www/html
RUN rm -f /etc/nginx/sites-enabled/default /etc/nginx/sites-available/default
COPY ./conf/default.conf /etc/nginx/sites-available/default.conf
RUN ln -s /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/default.conf

RUN apt -y install openssl
RUN mkdir -p /etc/nginx/ssl
RUN openssl req \
	-new \
	-newkey rsa:4096 \
	-days 365 \
	-nodes \
	-x509 \
	-subj "/C=FT/ST=IDF/L=Paris/O=42/OU=antbarbi/CN=localhost" \
	-keyout /etc/nginx/ssl/inception.key \
	-out /etc/nginx/ssl/inception.crt

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
