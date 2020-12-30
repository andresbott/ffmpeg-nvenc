# ffmpeg-nvenc
Build FFmpeg with nvenc

    # https://trac.ffmpeg.org/wiki/CompilationGuide/Ubuntu
    # https://github.com/lutris/ffmpeg-nvenc
    # https://github.com/ilyaevseev/ffmpeg-build
    # https://askubuntu.com/questions/778100/how-to-install-compile-nvenc-in-ubuntu
    # https://docs.nvidia.com/video-technologies/video-codec-sdk/ffmpeg-with-nvidia-gpu/index.html


# about cuda versions


see: https://docs.nvidia.com/deploy/cuda-compatibility/index.html

check your current cuda support:
    
    nvidia-smi

# issues 

    Driver does not support the required nvenc API version. Required: 11.0 Found: 10.0

Depending on the compiled cuda version you will need a specific diver, to solve this use a newer driver 
or downgrade NV_CODEC_HEADERS, see https://docs.nvidia.com/deploy/cuda-compatibility/index.html

e.g for nv codec api 10 drivers 450 are needed

# build
    
    # edit scripts/vars.sh 
    make && make clean

# dev

    docker run -it -v $(pwd):/build-util debian:buster-slim



# current changes to revert
installed manually cuda-libraries-11-2_11.2.0-1_amd64.deb

installed: libnvidia-encode1 
set to manual libnvcuvid1 