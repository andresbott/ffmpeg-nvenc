#!/bin/bash
set -e
source vars.sh

cd "$WORK_DIR/"
wget "http://www.nasm.us/pub/nasm/releasebuilds/$NASM_VERSION/nasm-$NASM_VERSION.tar.gz"
tar xzvf "nasm-$NASM_VERSION.tar.gz"
cd "nasm-$NASM_VERSION"
./configure --prefix="$DEST_DIR" --bindir="$DEST_DIR/bin"
make install distclean