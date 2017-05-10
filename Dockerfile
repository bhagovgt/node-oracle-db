FROM node:7.10

RUN mkdir -p /opt/install
WORKDIR /opt/install
ADD ./oracleclient .

RUN apt-get update \
  && apt-get install -y alien \
  && alien -i oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm \
  && alien -i oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm \
  && apt-get install -y libaio1
