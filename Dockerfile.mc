FROM golang:1.27-alpine
ARG VERSION=RELEASE.2025-08-13T08-35-41Z

ENV CGO_ENABLED=0
RUN apk add --no-cache git
RUN git clone -b ${VERSION} https://github.com/minio/mc.git
RUN cd mc && go build -trimpath -ldflags "$(go run buildscripts/gen-ldflags.go)" -o /mc main.go
RUN cd mc && rm -rf .git && tar -czf /mc.tar.gz .

FROM alpine:latest
COPY --from=0 /mc.tar.gz /mc.tar.gz
COPY --from=0 /mc /usr/local/bin/mc
ENTRYPOINT ["/usr/local/bin/mc"]