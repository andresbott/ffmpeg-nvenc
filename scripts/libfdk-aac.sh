#!/bin/bash
set -e
source vars.sh


cd "$WORK_DIR/"
git -C fdk-aac pull 2> /dev/null || git clone --depth 1 --branch ${FDK_AAC_VERSION} https://github.com/mstorsjo/fdk-aac.git
cd fdk-aac
autoreconf -fiv
./configure --prefix="$DEST_DIR" --disable-shared
make -j"${CPUS}" && make install

