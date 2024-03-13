#!/bin/bash
set -e

NASM_VERSION="2.16.01"    # https://www.nasm.us/pub/nasm/releasebuilds/
YASM_VERSION="1.3.0"      # http://www.tortall.net/projects/yasm/releases/

# https://code.videolan.org/videolan/x264/
# x264 is currently build from the HEAD of stable/master branch since the git repo does not have version tags
X264_BRANCH="master"      # master || stable

X265_VERSION="3.5"        # https://bitbucket.org/multicoreware/x265_git/downloads/?tab=tags
VPX_VERSION="v1.13.1"      # https://chromium.googlesource.com/webm/libvpx
FDK_AAC_VERSION="v2.0.3"  # https://github.com/mstorsjo/fdk-aac
LAME_VERSION="3.100"      # https://sourceforge.net/projects/lame/files/lame/
OPUS_VERSION="1.4"      # https://ftp.osuosl.org/pub/xiph/releases/opus/
AOM_VERSION="v3.8.0"      # https://aomedia.googlesource.com/aom
#FFMPEG_VERSION="6.1"    # http://ffmpeg.org/releases/
FFMPEG_VERSION="snapshot"    # http://ffmpeg.org/releases/

## Nvidia
CUDA_DIR="/usr/local/cuda"
NV_CODEC_HEADERS="n11.1.5.3" # https://git.videolan.org/?p=ffmpeg/nv-codec-headers.git;a=tags

#### PKG vars
PKG_VERSION="${FFMPEG_VERSION}-1-codec-api-11"
if [ ${FFMPEG_VERSION} = "snapshot" ]; then
    PKG_VERSION="6.1.snapshot-1-codec-api-11"
fi
MAINTAINER="Andres Bott"
MAIL=""
WEB="http://andresbott.com"

# Validation
VALIDATE_CUDA="false"

#### Build vars
WORK_DIR="/sources"
DEST_DIR="/ffmpeg-static"

CPUS=`nproc`

mkdir -p "$WORK_DIR" "$DEST_DIR" "$DEST_DIR/bin"
export PATH="$DEST_DIR/bin:$PATH"
