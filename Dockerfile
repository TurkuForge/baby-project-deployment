FROM openjdk:15-buster

EXPOSE 80

RUN mkdir /app

# Copy/Copies required files.
COPY ./nginx.conf.sigil /app
COPY ./.env /app
COPY ./web.sh /app

WORKDIR /app

CMD bash web.sh
