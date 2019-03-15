#Dockerfile for nodeje build slave as docker.


FROM jenkins/slave:latest
MAINTAINER Divyansh Srivastav<d.srivastav@celestialsys.com> 
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols" Vendor="Jenkins project" Version="3.27"

COPY jenkins-slave /usr/local/bin/jenkins-slave
USER root
RUN apt-get update && apt-get install curl apt-utils  -y 
RUN curl -sL https://deb.nodesource.com/setup_8.x |  bash -
RUN apt-get install nodejs build-essential -y
RUN mkdir -p /tmp/shared

ENTRYPOINT ["jenkins-slave"]
