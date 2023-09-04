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
    wget https://github.com/nanopool/nanominer/releases/download/v3.8.5/nanominer-linux-3.8.5.tar.gz && \
    tar xzvf nanominer-linux-3.8.5.tar.gz && \
    mv nanominer-linux-3.8.5 nanominer

WORKDIR /nanominer

CMD ["/nanominer/nanominer","/nanominer/config.ini"]
