IMAGE_NAME := pdf-extract
CONTAINER_FNAME := Containerfile

help:
	@echo "make build - Build and locally tag a new image."
	@echo "make build-force - Use a no-cache build"
	@echo "make run - run the monitor"
	@echo "make run-i - run the container and put you in a bash shell in the container"


build:
	@podman build -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) .

build-force:
	@podman pull ubi8
	@podman build  -t $(IMAGE_NAME) --file=$(CONTAINER_FNAME) --no-cache .

run: #you can't easily pass args to a make target
	@echo execute the following and add your parameter:
	@echo podman run --rm -it -v ${PWD}:/files:z $(IMAGE_NAME)

run-i:
	@podman run --rm -it --entrypoint "/bin/bash" $(IMAGE_NAME)
