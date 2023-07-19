FROM golang:1.21-rc-alpine AS build_dev

WORKDIR /home/devgo/app

COPY main.go .


RUN go build -ldflags '-s -w' main.go

FROM scratch

WORKDIR /app

COPY --from=build_dev /home/devgo/app/main /usr/bin/

ENTRYPOINT ["main"]