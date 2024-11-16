FROM debian:stable-slim

RUN  apt-get update && apt-get -y install sudo bash-completion joe

COPY ./ /build-util
WORKDIR /build-util
RUN chmod +x *.sh && chmod +x ./*.sh

RUN ./dependencies.sh
RUN ./nasm.sh
RUN ./yasm.sh
