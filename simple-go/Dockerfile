FROM golang:1.16-alpine

ENV GO111MODULE = on \
    CGO_ENABLE = 0 \
    GOOS = linux \
    GOARCH = amd64

WORKDIR /build
COPY .. .
RUN ["go", "build", "-o", "app", "."]


WORKDIR /dist
RUN ["cp", "/build/app", "."]

CMD ["/dist/app"]
