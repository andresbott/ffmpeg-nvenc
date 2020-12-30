#!/bin/bash
set -e
source vars.sh

sudo echo "deb http://ftp.ch.debian.org/debian/ buster non-free contrib"> /etc/apt/sources.list.d/non-free.list
sudo echo "deb https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/ /"> /etc/apt/sources.list.d/cuda.list
CUDA_REPO_KEY="https://developer.download.nvidia.com/compute/cuda/repos/debian10/x86_64/7fa2af80.pub"
sudo apt-key adv --fetch-keys "$CUDA_REPO_KEY"
sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install nvidia-driver
# workaround for: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
mkdir -p /usr/share/man/man1
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install cuda
sudo apt-get autoremove && sudo apt-get autoclean

