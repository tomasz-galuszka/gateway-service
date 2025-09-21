FROM ubuntu:22.04

RUN apt-get update -y
RUN apt install snapd -y
RUN snap info
RUN snap install --classic certbot
RUN ln -s /snap/bin/certbot /usr/bin/certbot