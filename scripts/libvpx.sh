#!/bin/bash
set -e
source vars.sh


cd "$WORK_DIR/"
git -C libvpx pull 2> /dev/null || git clone --depth 1 --branch ${VPX_VERSION} https://chromium.googlesource.com/webm/libvpx.git
cd libvpx
./configure --prefix="$DEST_DIR" --disable-examples --enable-runtime-cpu-detect --enable-vp9 --enable-vp8 \
--enable-postproc --enable-vp9-postproc --enable-multi-res-encoding --enable-webm-io --enable-better-hw-compatibility \
--enable-vp9-highbitdepth --enable-onthefly-bitpacking --enable-realtime-only \
--cpu=native --as=nasm --disable-docs
make && make install clean


