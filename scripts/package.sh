#!/bin/bash
set -e
source vars.sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "============================================================="
echo "  packaging debian file using nfpm"
echo "============================================================="
NFMP_URL="https://github.com/goreleaser/nfpm/releases/download/v2.1.0/nfpm_amd64.deb"

if ! command -v nfpms+ -version &> /dev/null
then
    echo "installing nfpm"
    cd "$WORK_DIR/"
    wget ${NFMP_URL}
    sudo dpkg -i "nfpm_amd64.deb"
    exit
fi

