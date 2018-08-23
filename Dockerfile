FROM ansible/awx_task:latest

USER root

RUN yum install -y php72u-cli php72u-json php72u-pdo php72u-dom \
    && yum -y clean all \
    && rm -rf /root/.cache

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require drush/drush:6.4.0

USER 1000
