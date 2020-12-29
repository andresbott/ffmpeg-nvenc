#!/bin/bash
set -e
source vars.sh

echo "============================================================="
echo "  packaging debian file using nfpm"
echo "============================================================="
NFMP_URL="https://github.com/goreleaser/nfpm/releases/download/v2.1.0/nfpm_amd64.deb"

if ! command -v nfpm -version &> /dev/null
then
    echo "installing nfpm"

    wget -O /tmp/nfpm_amd64.deb ${NFMP_URL}
    sudo dpkg -i "/tmp/nfpm_amd64.deb"
fi



cp "./nfpm.tpl.yaml" "${DEST_DIR}/nfpm.yaml"

cd "${DEST_DIR}/"

sed -i 's/#FFMPEG_VERSION#/'"${PKG_VERSION}"'/g' nfpm.yaml
sed -i 's/#MAINTAINER#/'"${MAINTAINER}"'/g' nfpm.yaml
sed -i 's/#MAIL#/'"${MAIL}"'/g' nfpm.yaml
sed -i "s~#WEB#~$WEB~g" nfpm.yaml

mkdir -p /out
nfpm pkg --packager deb --target /out/