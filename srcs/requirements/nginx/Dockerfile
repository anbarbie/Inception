FROM alpine:3.15

RUN apk update && apk upgrade
RUN apk add nginx
RUN mkdir -p /var/www/html
COPY ./conf/default.conf /etc/nginx/html.d/default.conf

RUN apk add openssl
RUN mkdir -p /var/www/ssl
RUN openssl req \
	-new \
	-newkey rsa:4096 \
	-days 365 \
	-nodes \
	-x509 \
	-subj "/C=FT/ST=IDF/L=Paris/O=42/OU=antbarbi/CN=localhost" \
	-keyout /var/www/ssl/inception.key \
	-out /var/www/ssl/inception.crt
RUN apk add openrc && rc-update add nginx default

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
