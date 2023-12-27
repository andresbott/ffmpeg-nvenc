#!/bin/bash
set -e
source vars.sh

sudo echo "deb http://ftp.ch.debian.org/debian/ bookworm non-free non-free-firmware contrib"> /etc/apt/sources.list.d/non-free.list

# not using the Nvidia cuda repository to keep compatibility between debian bookworm builder and target system
# but leaving code in case we need to change in the future

#sudo echo "deb https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/ /"> /etc/apt/sources.list.d/cuda.list
#CUDA_REPO_KEY="https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/3bf863cc.pub"
#sudo apt-key adv --fetch-keys "$CUDA_REPO_KEY"
sudo apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install nvidia-driver
# workaround for: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=863199
mkdir -p /usr/share/man/man1

#sudo DEBIAN_FRONTEND=noninteractive apt-get -y install cuda
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install nvidia-cuda-toolkit
sudo apt-get autoremove && sudo apt-get autoclean

