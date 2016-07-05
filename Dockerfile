FROM centos:centos7
MAINTAINER Guillaume Lunik <guillaume.lunik@gmail.com>

RUN yum -y install epel-release && \
    yum -y install \
    nginx \
    rsync \
    php-fpm && \
    yum clean all

ADD nginx.conf /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ADD php.ini /etc/php5/fpm/php.ini

#RUN /usr/sbin/php-fpm &
#RUN systemctl start php-fpm

EXPOSE 8080

RUN chmod -R go+rwx /var/lib/nginx

USER 999

CMD [ "/usr/sbin/nginx" , "&&", "/usr/sbin/php-fpm"]
