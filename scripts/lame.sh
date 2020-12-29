#!/bin/bash
set -e
source vars.sh


if [[ ${LAME_VERSION} =~ [0-9]+\.[0-9]+\.[0-9]+ ]]; then
  # version string is like 3.100.1
  vers=$(basename -- "${LAME_VERSION}")
  base_vers="${filename%.*}"
else
    # version string is like 3.100
  base_vers=$LAME_VERSION
fi

cd "$WORK_DIR/"

wget -4  "http://downloads.sourceforge.net/project/lame/lame/${base_vers}/lame-${LAME_VERSION}.tar.gz"
tar xzvf "lame-${LAME_VERSION}.tar.gz"
cd "lame-${LAME_VERSION}"
./configure --prefix="$DEST_DIR" --enable-nasm --disable-shared
make -j"${CPUS}" && make install distclean

