#!/bin/bash
set -e
source vars.sh

cd "${WORK_DIR}/"

#git -C x265_git pull 2> /dev/null || git clone https://bitbucket.org/multicoreware/x265_git
wget -4 -O libx265.tar.bz2 "https://bitbucket.org/multicoreware/x265_git/get/${X265_VERSION}.tar.bz2"

rm -rf ./x265_git || :
mkdir x265_git && tar xjvf ./libx265.tar.bz2 -C x265_git --strip-components 1
cd x265_git/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$DEST_DIR" -DENABLE_SHARED=off ../../source
make -j"${CPUS}"&& make install

# forward declaration should not be used without struct keyword!
#sed -i.orig -e 's,^ *x265_param\* zoneParam,struct x265_param* zoneParam,' "$DEST_DIR/include/x265.h"