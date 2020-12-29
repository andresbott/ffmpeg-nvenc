#!/bin/bash
set -e


NASM_VERSION="2.15.05"    # https://www.nasm.us/pub/nasm/releasebuilds/
YASM_VERSION="1.3.0"      # http://www.tortall.net/projects/yasm/releases/

# https://code.videolan.org/videolan/x264/
# x264 is currently build from the HEAD of stable/master branch since the git repo does not have version tags
X264_BRANCH="master"      # master || stable

X265_VERSION="3.4"        # https://bitbucket.org/multicoreware/x265_git/downloads/?tab=tags
VPX_VERSION="v1.9.0"      # https://chromium.googlesource.com/webm/libvpx
FDK_AAC_VERSION="v2.0.1"  # https://github.com/mstorsjo/fdk-aac
LAME_VERSION="3.100"      # https://sourceforge.net/projects/lame/files/lame/
OPUS_VERSION="1.3.1"      # https://ftp.osuosl.org/pub/xiph/releases/opus/
AOM_VERSION="v2.0.1"      # https://aomedia.googlesource.com/aom
FFMPEG_VERSION="4.3.1"         # http://ffmpeg.org/releases/

WORK_DIR="$HOME/ffmpeg-build-static-sources"
DEST_DIR="$HOME/ffmpeg-build-static-binaries"
CUDA_DIR="/usr/local/cuda"
CPUS=`nproc`


mkdir -p "$WORK_DIR" "$DEST_DIR" "$DEST_DIR/bin"
export PATH="$DEST_DIR/bin:$PATH"
