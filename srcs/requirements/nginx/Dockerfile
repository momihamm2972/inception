FROM debian:bullseye

RUN apt update && apt install nginx -y

RUN apt install vim -y

RUN mkdir -p /etc/nginx/ssl

RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=MA/ST=IDF/L=Khouribga/O=42/OU=42/CN=momihamm.42.fr/UID=momihamm"

# RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/sites-enabled/default.conf

COPY tools/index.html /var/www/html/index.html



CMD [ "nginx", "-g", "daemon off;" ]