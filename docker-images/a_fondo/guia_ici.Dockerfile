FROM centos

RUN yum install httpd -y

COPY startbootstrap-sb /var/www/html

CMD apachectl -DFOREGROUND