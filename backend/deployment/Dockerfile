FROM golang:1.21.5 AS builder

WORKDIR /go/src
COPY ./ /go/src

RUN GOOS=linux GOARCH=amd64 go build -o golang-demo ./... && \
    chmod +x golang-demo

FROM scratch

WORKDIR /go/src
COPY --from=builder /go/src/golang-demo ./golang-demo

CMD ["./golang-demo"]
