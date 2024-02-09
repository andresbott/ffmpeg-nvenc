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

# check x264 is present
r=$(./ffmpeg -hide_banner -codecs  | grep x264 || true)
asert_string "$r" "libx264"
# check x265 is present
r=$(./ffmpeg -hide_banner -codecs  | grep x265 || true )
asert_string "$r " "libx265"

# check hevc_nvenc is present
r=$(./ffmpeg -hide_banner -encoders | grep hevc_nvenc || true )
asert_string "$r " "hevc_nvenc"
# check hevc_vaapi is present
r=$(./ffmpeg -hide_banner -encoders | grep hevc_vaapi || true )
asert_string "$r " "hevc_vaapi"


SAMPLE_URL="https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"
SAMPLE="/tmp/sample.mp4"
if [ "${VALIDATE_CUDA}" == "true" ]; then
  if [ ! -f ${SAMPLE} ]; then
    wget -4 -O ${SAMPLE} "${SAMPLE_URL}"
  fi

  "$DEST_DIR/bin/ffmpeg" -y -vsync 0 -hwaccel cuda -hwaccel_output_format cuda -i ${SAMPLE} -c:a copy -c:v h264_nvenc -b:v 5M /tmp/output1.mp4


else
  echo "skipping cuda validations"
fi
