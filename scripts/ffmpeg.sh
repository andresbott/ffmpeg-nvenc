#!/bin/bash
set -e
source vars.sh


cd "$WORK_DIR/"

if [ ! -f  ffmpeg-${FFMPEG_VERSION}.tar.bz2 ]; then
    wget -4 http://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.bz2
fi
tar xjf ffmpeg-${FFMPEG_VERSION}.tar.bz2
cd ffmpeg-${FFMPEG_VERSION}

export PATH="$CUDA_DIR/bin:$PATH"  # ..path to nvcc

# note new cuda 11 requires to define the cuda arch as described here https://trac.ffmpeg.org/ticket/8790
#   --nvccflags="-gencode arch=compute_30,code=sm_30 -O2" \

PKG_CONFIG_PATH="$DEST_DIR/lib/pkgconfig:$DEST_DIR/lib64/pkgconfig" \
    ./configure \
    --prefix="$DEST_DIR" \
    --bindir="$DEST_DIR/bin" \
    \
    --pkg-config-flags="--static" \
    --extra-cflags="-I $DEST_DIR/include -I $CUDA_DIR/include/" \
    --extra-ldflags="-L $DEST_DIR/lib -L $CUDA_DIR/lib64/" \
    --extra-libs="-lpthread -lm" \
    --arch=amd64 \
    \
    --enable-pic \
    --enable-gpl \
    --enable-gnutls \
    --enable-libaom \
    --enable-libass \
    --enable-libfdk-aac \
    --enable-libfreetype \
    --enable-libmp3lame \
    --enable-libopus \
    --enable-libvorbis \
    --enable-libtheora \
    --enable-libvpx \
    --enable-libx264 \
    --enable-libx265 \
    --extra-ldexeflags=-pie \
    \
    --nvccflags="-gencode arch=compute_52,code=sm_52 -O2" \
    --enable-nonfree \
    --enable-libnpp \
    --enable-cuda \
    --enable-cuda-nvcc \
    --enable-nvenc

make -j"${CPUS}" && make install distclean

retVal=$?
if [ $retVal -ne 0 ]; then
    cat "$WORK_DIR/ffbuild/config.log"
fi



#
##    --enable-nvenc \
## --enable-libxcb is autodetected
#
#
#
#
#
#PATH="$HOME/bin:$PATH" make && \
#make install && \
#hash -r
#
##        --incdir="$nvidia_inc_dir" \
##      --extra-cflags="-fPIC -m64 -I $DEST_DIR/include -I $CUDA_DIR/include/" \
##      --extra-ldflags="-L $DEST_DIR/lib -L $CUDA_DIR/lib64/" \
##
#
#
#make -j"${CPUS}" && make install