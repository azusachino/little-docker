FROM golang:1.16-alpine as buider

ENV GO111MODULE = on \
    GOPROXY=https://goproxy.cn,direct \
    CGO_ENABLE = 0 \
    GOOS = linux \
    GOARCH = amd64

WORKDIR /build
COPY .. .
RUN ["go", "build", "-o", "app", "."]


FROM alpine:latest
WORKDIR /dist
COPY --from=buider /build/app .
CMD ["/dist/app"]
