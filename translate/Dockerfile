FROM alpine:latest as download

RUN apk update && \
    apk add wget

WORKDIR /app

RUN wget https://github.com/transifex/cli/archive/refs/tags/v1.4.1.tar.gz

RUN tar -xzf v1.4.1.tar.gz && rm v1.4.1.tar.gz

# ----

FROM golang:alpine as builder

ENV GO111MODULE=on \
    GOPROXY=https://goproxy.cn,direct

WORKDIR /app

COPY --from=download /app/cli-1.4.1 .

RUN GOOS=linux go build -o ./bin/tx && chmod +x bin/*

# ----

FROM alpine:latest

RUN apk update && apk add bash python3

COPY --from=builder /app/bin/* /usr/bin/

COPY entrypoint.py /usr/bin/

ENV USER=docker
ENV UID=1000
ENV GID=1000

RUN adduser \
    --disabled-password \
    --gecos "" \
    --uid "$UID" \
    "$USER"

USER $USER

ENTRYPOINT ["/usr/bin/python3", "/usr/bin/entrypoint.py"]
