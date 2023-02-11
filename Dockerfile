FROM alpine:latest

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php8 php8-fpm php8-mysql php8-pgsql php8-sqlite3 php8-bcmath php8-mbstring php8-xml php8-curl php8-zip php8-gd
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./System/EntryPoint.sh /EntryPoint.sh

CMD ["/bin/ash", "/EntryPoint.sh"]
