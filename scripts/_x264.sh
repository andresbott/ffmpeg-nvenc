#!/bin/bash
set -e
source vars.sh


X264_SOURCE=""
if [ "$X264_BRANCH" == "master" ]; then
  X264_SOURCE="https://code.videolan.org/videolan/x264/-/archive/master/x264-master.tar.bz2"
elif [ "$X264_BRANCH" == "stable" ]; then
  X264_SOURCE="https://code.videolan.org/videolan/x264/-/archive/stable/x264-stable.tar.bz2"
else
  echo "x264 not specified, exit"
  exit
fi

cd "$WORK_DIR/"
wget -4 -O libx264.tar.bz2 "$X264_SOURCE"
rm -rf ./x264_git || :
mkdir x264_git && tar xjvf ./libx264.tar.bz2 -C x264_git --strip-components 1
cd x264_git
./configure --prefix="$DEST_DIR" --bindir="$DEST_DIR/bin" --enable-static --enable-pic
make -j"${CPUS}" && make install distclean


