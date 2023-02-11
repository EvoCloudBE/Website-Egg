FROM alpine:latest

RUN apk --update --no-cache add curl ca-certificates nginx
RUN apk add php8 php8-*
COPY --from=composer:latest  /usr/bin/composer /usr/bin/composer

USER container
ENV  USER container
ENV HOME /home/container

WORKDIR /home/container
COPY ./System/EntryPoint.sh /EntryPoint.sh

CMD ["/bin/ash", "/EntryPoint.sh"]
