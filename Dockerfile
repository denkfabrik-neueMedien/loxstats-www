FROM ubuntu:xenial
MAINTAINER Marco Kernler <marco.kernler@denkfabrik-neueMedien.de>

### SET UP

RUN apt-get -qq update
RUN apt-get -qqy install sudo wget nano curl make locales
RUN echo "LANG=de_DE.UTF-8\n" > /etc/default/locale && \
	echo "de_DE.UTF-8 UTF-8\n" > /etc/locale.gen && \
	locale-gen

# APACHE, MYSQL, PHP & SUPPORT TOOLS
RUN apt-get -qqy install apache2 php5-cli libapache2-mod-php5 php5-mysqlnd php5-mcrypt php5-tidy php5-curl php5-gd php-pear

# SilverStripe Apache Configuration
ADD apache_default /etc/apache2/sites-available/000-default.conf
RUN a2enmod rewrite && \
	rm /var/www/html/index.html && \
	echo "date.timezone = Europe/Berlin" > /etc/php5/apache2/conf.d/timezone.ini

# Add the correct permissions for the local folder
RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

#
ADD apache-foreground /usr/local/bin/apache-foreground

####
## Commands and ports
EXPOSE 80

# Run apache in foreground mode, because Docker needs a foreground
WORKDIR /var/www/html
CMD ["/usr/local/bin/apache-foreground"]

ENV LANG de_DE.UTF-8