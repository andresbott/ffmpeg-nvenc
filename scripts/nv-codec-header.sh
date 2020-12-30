#!/bin/bash
set -e
source vars.sh


cd "$WORK_DIR/"
git -C nv-codec-headers pull 2> /dev/null || git clone --depth 1 --branch ${NV_CODEC_HEADERS} https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
cd nv-codec-headers

make
make install PREFIX="$DEST_DIR"

