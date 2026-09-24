MINIO_VERSION=RELEASE.2025-10-15T17-29-55Z
MC_VERSION=RELEASE.2025-08-13T08-35-41Z

build-minio:
	docker build --pull --push \
	--platform=linux/amd64,linux/arm64 \
	--build-arg VERSION=$(MINIO_VERSION) \
	-f Dockerfile.minio \
	-t paskalmaksim/minio:$(MINIO_VERSION) .

build-mc:
	docker build --pull --push \
	--platform=linux/amd64,linux/arm64 \
	--build-arg VERSION=$(MC_VERSION) \
	-f Dockerfile.mc \
	-t paskalmaksim/mc:$(MC_VERSION) .