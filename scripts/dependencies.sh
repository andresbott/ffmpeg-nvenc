#!/bin/bash

sudo apt-get update

sudo apt-get -y install wget \
  unzip bzip2 autoconf automake libtool patch make cmake git \
  build-essential pkg-config python3 \
  libnuma-dev bash-completion gnutls-bin

## install dependencies for libfreetype
sudo apt-get -y install libfreetype6-dev

## install dependencies for libass
sudo apt-get -y install libass-dev

## install dependencies for libxcb
sudo apt-get -y install libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev \
  libqt5x11extras5-dev libxcb-xinerama0-dev libxcb-shape0-dev

## install dependencies for ffmpeg
sudo apt-get -y install libunistring-dev libgnutls28-dev libtheora-dev  libvorbis-dev