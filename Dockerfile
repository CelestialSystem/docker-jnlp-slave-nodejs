#Dockerfile for nodeje build slave as docker.
  

FROM jenkins/slave:latest
MAINTAINER Divyansh Srivastav<d.srivastav@celestialsys.com>
LABEL Description="This is a base image, which allows connecting Jenkins agents via JNLP protocols" Vendor="Jenkins project" Version="3.27"

COPY jenkins-slave /usr/local/bin/jenkins-slave
USER root
apt-get update && apt-get install curl libltdl-dev -y 
RUN curl -sL https://deb.nodesource.com/setup_8.x |  bash -
RUN apt-get update && apt-get install apt-utils apt-transport-https software-properties-common nodejs python3-pip -y
RUN pip3 install awscli --upgrade --user
RUN ln -s ~/.local/bin/aws /usr/local/bin/aws
RUN mkdir -p /tmp/shared

ENTRYPOINT ["jenkins-slave"]
