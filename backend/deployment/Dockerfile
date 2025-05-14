FROM golang:1.21.5

WORKDIR /go/src
COPY ./ /go/src

RUN GOOS=linux GOARCH=amd64 go build -o golang-demo ./... && \
    chmod +x golang-demo

CMD ["./golang-demo"]
