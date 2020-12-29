FROM debian:buster-slim AS build-context

# install all dependenvies on a layer for faster reiteration
RUN  apt-get update && apt-get -y install sudo bash-completion joe

COPY ./ /build-util
WORKDIR /build-util
RUN chmod +x *.sh && chmod +x ./scripts/*.sh

RUN ./scripts/dependencies.sh

FROM ffmpeg-static-build-context


#RUN ./scripts/x264.sh
#RUN ./scripts/x265.sh
#RUN ./scripts/libvpx.sh
#RUN ./scripts/libfdk-aac.sh
#RUN ./scripts/lame.sh
#RUN ./scripts/opus.sh
#RUN ./scripts/aom.sh
#RUN ./scripts/ffmpeg.sh
#RUN ./scripts/package.sh