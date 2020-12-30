FROM ffmpeg-static-build-nv-libs

COPY ./ /build-util
WORKDIR /build-util

RUN ./ffmpeg.sh
RUN ./validation.sh
RUN ./package.sh
