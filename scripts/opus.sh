#!/bin/bash
set -e
source vars.sh


cd "$WORK_DIR/"

wget -4  "http://downloads.xiph.org/releases/opus/opus-$OPUS_VERSION.tar.gz"
tar xzvf "opus-$OPUS_VERSION.tar.gz"
cd "opus-$OPUS_VERSION"
#./autogen.sh
./configure --prefix="$DEST_DIR" --disable-shared
make -j"${CPUS}" && make install distclean
