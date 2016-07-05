FROM centos:centos7
MAINTAINER Guillaume Lunik <guillaume.lunik@gmail.com>

RUN yum -y install epel-release && \
    yum -y install \
    nginx \
    rsync \
    php5-fpm && \
    yum clean all

ADD nginx.conf /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD php.ini /etc/php5/fpm/php.ini

RUN systemctl start php5-fpm.service

EXPOSE 8080

RUN chmod -R go+rwx /var/lib/nginx

USER 999

CMD [ "/usr/sbin/nginx" ]
