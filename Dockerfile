FROM ansible/awx_task:latest

USER root

RUN yum install -y php72u-cli php72u-json php72u-pdo php72u-dom which \
    && pip install --upgrade ansible-tower-cli \
    && yum -y clean all \
    && rm -rf /root/.cache

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require drush/drush:8.1.16
    
ENV PATH="/root/.composer/vendor/bin:${PATH}"

USER 1000
