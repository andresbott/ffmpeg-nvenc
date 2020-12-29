FROM ffmpeg-static-build-libs

COPY ./ /build-util
WORKDIR /build-util

RUN ./ffmpeg.sh
RUN ./package.sh
