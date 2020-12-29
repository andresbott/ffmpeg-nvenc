#!/bin/bash
set -e
source vars.sh


cd "$WORK_DIR/"
wget "http://www.tortall.net/projects/yasm/releases/yasm-$YASM_VERSION.tar.gz"
tar xzvf "yasm-$YASM_VERSION.tar.gz"
cd "yasm-$YASM_VERSION/"
./configure --prefix="$DEST_DIR" --bindir="$DEST_DIR/bin"
make install distclean