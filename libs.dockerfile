FROM ffmpeg-static-build-base

COPY ./ /build-util
WORKDIR /build-util

RUN ./x264.sh
RUN ./x265.sh
RUN ./libvpx.sh
RUN ./libfdk-aac.sh
RUN ./lame.sh
RUN ./opus.sh
RUN ./aom.sh
