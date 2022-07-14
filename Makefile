BUILD_NAME := genv/webdriver-chromium
BUILD_DATE := $(shell date -u "+%Y%m%dT%H%M%SZ")

build: docker-build push
.PHONY: build

include .env

docker-build:
	docker build \
		--no-cache \
		-t $(BUILD_NAME):$(BUILD_VERSION) \
		-t $(BUILD_NAME):$(BUILD_VERSION)-$(BUILD_DATE) \
		-t $(BUILD_NAME):latest \
	.;
.PHONY: docker-build
.SILENT: docker-build

push:
	docker push $(BUILD_NAME):$(BUILD_VERSION); \
	docker push $(BUILD_NAME):$(BUILD_VERSION)-$(BUILD_DATE); \
	docker push $(BUILD_NAME):latest;
.PHONY: push
.SILENT: push

interactive:
	docker run --cap-add=SYS_ADMIN -ti $(BUILD_NAME):$(BUILD_VERSION);
.PHONY: interactive
.SILENT: interactive
