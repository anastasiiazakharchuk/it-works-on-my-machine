FROM golang:1.23.5 AS builder

WORKDIR /go/src
COPY ./ /go/src

RUN go mod download
RUN go mod verify
RUN GOOS=linux GOARCH=amd64 go build -o golang-demo ./... && \
    chmod +x golang-demo

CMD ["./golang-demo"]

FROM builder AS dev

FROM --platform=linux/amd64 alpine AS prod

WORKDIR /go/src
COPY --from=builder /go/src/golang-demo ./golang-demo

CMD ["./golang-demo"]
