FROM ffmpeg-static-build-libs

COPY ./ /build-util
WORKDIR /build-util

RUN ./nv-codec-header.sh
RUN ./nv-cuda-sdk.sh
