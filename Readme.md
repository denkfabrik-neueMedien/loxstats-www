# [dnkfbrknme/loxstats-www](https://registry.hub.docker.com/u/dnkfbrknme/loxstats-www/)

## Description
A docker image for running [LoxStats](http://www.loxstats.de) within a docker container. This image will install the following components:

* Apache 2.4
* PHP 5.6

... and does NOT include any database!

## Usage

  docker run -dP -p 3000:80 -v <your-local-folder>:/var/www/html dnkfbrknme/loxstats-www

