FROM tghs/phpcli

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y curl git php7.0-mcrypt php7.0-gd && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update && \
    apt-get remove --purge curl -y && \
    apt-get clean

RUN mkdir -p /data/www # wat

VOLUME ["/data"]
WORKDIR /data

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["--help"]
