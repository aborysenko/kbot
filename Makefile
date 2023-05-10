APP = $(shell basename $(shell git remote get-url origin))
REGISTRY=aborysenko
VERSION = $(shell git describe --tags --abbrev=0)-$(shell git rev-parse --short HEAD)
TARGETOS = linux
TARGETARCH = amd64

format:
	gofmt -s -w ./

lint:
	golint

test:
	go test -v

arm: TARGETARCH = arm
arm: build

macOS: TARGETOS = macOS
macOS: build

Windows: TARGETOS = Windows
Windows: build

build: format
	CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -v -o kbot -ldflags "-X="github.com/aborysenko/kbot/cmd.appVersion=${VERSION}

image:
	docker build . -t ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

push:
	docker push ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}

clean:
	docker rmi ${REGISTRY}/${APP}:${VERSION}-${TARGETARCH}
	rm -rf kbot