#!/bin/bash

IMG="ffmpeg-static-build-ffmpeg-static"
id=$(docker create ${IMG})
docker cp $id:/out ./
docker rm -v $id

