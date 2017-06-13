FROM node:6.9

RUN mkdir -p /opt/install
WORKDIR /opt/install
ADD ./oracleclient .

RUN apt-get update \
  && apt-get install -y alien \
  && alien -i oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm \
  && alien -i oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm \
  && apt-get install -y libaio1

ENV ORACLE_HOME=/usr/lib/oracle/12.2/client64
ENV PATH=$PATH:$ORACLE_HOME/bin
ENV LD_LIBRARY_PATH=$ORACLE_HOME/lib
