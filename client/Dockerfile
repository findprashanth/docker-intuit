FROM ubuntu:12.04


RUN apt-get update && apt-get install -y apache2 python-openstackclient && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

COPY openrc_admin /root/openrc_admin1
COPY openrc_admin1 /root/openrc_admin

EXPOSE 80

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
