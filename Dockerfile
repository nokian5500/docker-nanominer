FROM ubuntu:18.04 as base

ARG VER
RUN \
    apt update -y && \
    apt install -yqq \
     ca-certificates \
     wget \
     curl \
     telnet \
     gpg \
     apt-transport-https &&\
    apt clean && \
    wget https://github.com/nokian5500/docker-nanominer/archive/refs/tags/v3.8.5.tar.gz && \
    tar xzvf v3.8.5.tar.gz && \
    mv v3.8.5 nanominer

WORKDIR /nanominer

CMD ["/nanominer/nanominer","/nanominer/config.ini"]
