FROM ubuntu:14.04.2
MAINTAINER Andrei Malyshev
RUN echo 'LANG="ru_RU.UTF-8"' >> /etc/default/locale
RUN apt-get update
RUN locale-gen ru_RU
RUN locale-gen ru_RU.UTF-8
RUN apt-get install imagemagick build-essential wget libmagickwand-dev git -y
RUN wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz && tar -xzvf ruby-install-0.5.0.tar.gz && cd ruby-install-0.5.0/ && make install
RUN wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz && tar -xzvf chruby-0.3.9.tar.gz && cd chruby-0.3.9/ && sudo make install
RUN echo 'source /usr/local/share/chruby/chruby.sh' >> /etc/profile.d/chruby.sh
ADD ./internal_run.sh /root/internal_run.sh
RUN chmod +x /root/internal_run.sh
ENTRYPOINT /root/internal_run.sh
EXPOSE 3000