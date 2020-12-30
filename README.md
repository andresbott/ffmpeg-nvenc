# ffmpeg-nvenc

scripts used to build a statically linked ffmpeg with nvenc withing a docker container and output as deb package.

This scripts were inspired on:

* https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
* https://github.com/lutris/ffmpeg-nvenc
* https://github.com/ilyaevseev/ffmpeg-build
* https://askubuntu.com/questions/778100/how-to-install-compile-nvenc-in-ubuntu
* https://docs.nvidia.com/video-technologies/video-codec-sdk/ffmpeg-with-nvidia-gpu/index.html

## How to build

    # edit scripts/vars.sh 
    $ make
    # package is located in ./out
    $ make clean # clean docker images used in the build

# about cuda versions / issues 

    Driver does not support the required nvenc API version. Required: 11.0 Found: 10.0

Depending on the compiled cuda version you will need a specific diver, to solve this use a newer driver 
or downgrade NV_CODEC_HEADERS, see https://docs.nvidia.com/deploy/cuda-compatibility/index.html

e.g for nv codec api 10 drivers 450 are needed

check your current cuda support:

    nvidia-smi

# dev

    docker run -it -v $(pwd):/build-util debian:buster-slim

