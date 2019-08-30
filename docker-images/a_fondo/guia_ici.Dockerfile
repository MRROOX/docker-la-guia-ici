FROM centos

RUN yum install httpd -y

COPY startbootstrap-sb-admin-2 /var/www/html

CMD apachectl -DFOREGROUND