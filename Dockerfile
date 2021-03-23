FROM openjdk:15-buster

EXPOSE 80

RUN mkdir /app

# Copying requered files
COPY ./nginx.conf.sigil /app
COPY ./.env /app
COPY ./web.sh /app

WORKDIR /app

CMD bash web.sh
