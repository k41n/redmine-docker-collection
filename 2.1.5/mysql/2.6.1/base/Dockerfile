FROM tutum.co/k41n/redmine-docker-collection-2_1_5-mysql-base
MAINTAINER Andrei Malyshev
RUN mkdir -p /var/www/
RUN cd /var/www/ && wget http://www.redmine.org/releases/redmine-2.6.1.tar.gz && tar -xzf redmine-2.6.1.tar.gz && rm -f redmine-2.6.1.tar.gz && mv redmine-2.6.1 redmine
RUN cd /var/www/redmine && chruby-exec ruby-2.1.5 -- gem install bundle
ADD ./database.yml /var/www/redmine/config/database.yml
RUN cd /var/www/redmine && ls -la && chruby-exec ruby-2.1.5 -- bundle install

RUN mkdir /root/.ssh
ADD ./id_rsa_docker /root/.ssh/id_rsa
ADD ./id_rsa_docker.pub /root/.ssh/id_rsa.pub
ADD ./.sshconfig /etc/ssh/ssh_config
RUN chmod -R 600 /root/.ssh

ADD ./first_provision.sh /root/first_provision.sh
RUN chmod +x /root/first_provision.sh
RUN /root/first_provision.sh
