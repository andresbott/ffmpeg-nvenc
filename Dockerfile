FROM debian:buster-slim

# install all dependenvies on a layer for faster reiteration
RUN  apt-get update && apt-get -y install sudo bash-completion joe



WORKDIR /ffmpeg
COPY scripts ./
RUN chmod +x *.sh

#
#RUN /ffmpeg/build.sh