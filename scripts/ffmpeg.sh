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

PKG_CONFIG_PATH="$DEST_DIR/lib/pkgconfig:$DEST_DIR/lib64/pkgconfig" \
    ./configure \
    --prefix="$DEST_DIR" \
    --bindir="$DEST_DIR/bin" \
    \
    --pkg-config-flags="--static" \
    --extra-cflags="-m64 -I $DEST_DIR/include -I $CUDA_DIR/include/" \
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
    --enable-nonfree \
    --extra-ldexeflags=-pie


make -j"${CPUS}" && make install distclean




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