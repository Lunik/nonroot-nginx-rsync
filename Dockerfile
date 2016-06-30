FROM tomaskral/nonroot-nginx
MAINTAINER Guillaume Lunik <guillaume.lunik@gmail.com>

RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install rsync
