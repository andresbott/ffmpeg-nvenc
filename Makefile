build: libs
	@echo "building ffmpeg"
	@mkdir -p build/ffmpeg
	@cp ./vars.sh ./build/ffmpeg
	@cp ./scripts/ffmpeg.sh ./build/ffmpeg
	@cp ./scripts/package.sh ./build/ffmpeg
	@cp ./nfpm.tpl.yaml ./build/ffmpeg

	@cp ./ffmpeg.dockerfile ./build/ffmpeg/Dockerfile
	@docker build ./build/ffmpeg -t ffmpeg-static-build-ffmpeg-static
	@./scripts/copy.sh

libs: base
	@echo "building video libs"
	@mkdir -p build/libs
	@cp ./vars.sh ./build/base
	@cp ./scripts/x264.sh ./build/libs
	@cp ./scripts/x265.sh ./build/libs
	@cp ./scripts/libvpx.sh ./build/libs
	@cp ./scripts/libfdk-aac.sh ./build/libs
	@cp ./scripts/lame.sh ./build/libs
	@cp ./scripts/opus.sh ./build/libs
	@cp ./scripts/aom.sh ./build/libs

	@cp ./libs.dockerfile ./build/libs/Dockerfile
	@docker build ./build/libs -t ffmpeg-static-build-libs

base:
	@echo "building docker base image"
	@mkdir -p build/base
	@cp ./vars.sh ./build/base
	@cp ./scripts/dependencies.sh ./build/base
	@cp ./scripts/nasm.sh ./build/base
	@cp ./scripts/yasm.sh ./build/base
	@cp ./base.dockerfile ./build/base/Dockerfile
	@docker build ./build/base -t ffmpeg-static-build-base


clean:
	@echo "cleaning"
	@ rm -rf ./build