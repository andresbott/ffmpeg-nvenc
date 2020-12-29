#!/bin/bash
set -e
source vars.sh


cd "$WORK_DIR/"
git -C aom pull 2> /dev/null || git clone --depth 1 --branch ${AOM_VERSION} https://aomedia.googlesource.com/aom

mkdir -p aom_build
cd aom_build
which cmake3 && PROG=cmake3 || PROG=cmake
$PROG -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$DEST_DIR" -DENABLE_SHARED=off -DENABLE_NASM=on ../aom
make -j"${CPUS}" && make install