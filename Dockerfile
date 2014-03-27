FROM jprjr/arch

MAINTAINER John Regan <john@jrjrtech.com>

RUN pacman -Syy --noconfirm --quiet > /dev/null

RUN pacman -S --noconfirm --quiet --needed php-fpm php-gd \
    php-mcrypt php-ldap php-sqlite php-pgsql php-pear >/dev/null 2>/dev/null

RUN sed -i 's/;extension=gd.so/extension=gd.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=iconv.so/extension=iconv.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=mcrypt.so/extension=mcrypt.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=mysql.so/extension=mysql.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=sqlite3.so/extension=sqlite3.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=pgsql.so/extension=pgsql.so/g' /etc/php/php.ini
RUN sed -i 's/;extension=ldap.so/extension=ldap.so/g' /etc/php/php.ini

RUN sed -i '/^listen/c \
listen = 0.0.0.0:9000' /etc/php/php-fpm.conf

EXPOSE 9000
ENTRYPOINT ["php-fpm","-F"]
