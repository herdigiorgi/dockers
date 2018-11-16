FROM openjdk:8

ENV SBT_VERSION 1.2.6

RUN \
  curl -L -o sbt-$SBT_VERSION.deb http://dl.bintray.com/sbt/debian/sbt-$SBT_VERSION.deb && \
  dpkg -i sbt-$SBT_VERSION.deb && \
  rm sbt-$SBT_VERSION.deb && \
  apt-get update && \
  apt-get install sbt && \
  sbt sbtVersion

RUN apt-get update && apt-get -y install imagemagick 

RUN apt-get update && \
  apt-get remove -y --purge python && \
  apt-get autoremove -y && \
  apt-get install -y python3 && \
  ln -s /usr/bin/python3 /usr/bin/python

RUN apt-get update && \
  apt-get install -y mysql-client

RUN mkdir /opt/source
WORKDIR /opt/source
USER root