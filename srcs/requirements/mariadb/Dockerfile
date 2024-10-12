FROM debian:bullseye

RUN apt update -y && apt-get install mariadb-server -y

COPY ./tools/script.sh /home/script.sh

RUN chmod 744 /home/script.sh

CMD [ "./home/script.sh" ]