#!/bin/bash
set -e
source vars.sh


function asert_string {
  base="$1"
  pattern="$2"

  if [[ $base == *"$pattern"* ]]; then
      echo "$pattern" found
  else
      echo "$pattern" NOT found
      exit 1
  fi

}

cd "$DEST_DIR/bin"

r=$(./ffmpeg -hide_banner -codecs  | grep x264 || true)
asert_string "$r" "libx264"

r=$(./ffmpeg -hide_banner -codecs  | grep x265 || true )
asert_string "$r " "libx265"


