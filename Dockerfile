FROM ubuntu:14.04
MAINTAINER Usman Ismail <usman@techtraits.com>
EXPOSE 8082

RUN apt-get -qq update
RUN apt-get -y upgrade
RUN apt-get -qq install nodejs npm mongodb git

RUN mkdir /opt/uptime
RUN rm -fr /opt/uptime && git clone --depth=1 https://github.com/fzaninotto/uptime.git  /opt/uptime


WORKDIR /opt/uptime
RUN npm install

RUN rm /opt/uptime/config/default.yaml
ADD default.yaml /opt/uptime/config/default.yaml

ADD run-uptime.sh /opt/run-uptime.sh
RUN chmod +x /opt/run-uptime.sh

ENTRYPOINT ["/opt/run-uptime.sh"]
CMD ["rootpass"]
