IMAGE_NAME := blender-render
CONTAINER_FNAME := Containerfile

help:
	@echo "make build - Build and locally tag a new image."
	@echo "make build-force - Use a no-cache build"
	@echo "make run - run the render, don't forget to pass it a blend file"
	@echo "make run-i - run the container and put you in a bash shell in the container"
	@echo ""
	@echo "NOTE: you will need to download the blender tar ball before you can build this image."
	@echo "NOTE: the link is here: https://download.blender.org/release/Blender2.83/blender-2.83.3-linux64.tar.xz"


build:
	@podman build -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) .

build-force:
	@podman pull ubi8
	@podman build  -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) --no-cache .

run: #you can't easily pass args to a make target
	@echo execute the following and add your parameter:
	@echo podman run --rm -it -v ${PWD}:/files:z $(IMAGE_NAME)

run-i:
	@podman run --rm -it -v ${PWD}:/files:z --entrypoint "/bin/bash" $(IMAGE_NAME)
