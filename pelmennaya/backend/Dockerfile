FROM golang:1.20 AS builder

WORKDIR /app
COPY go.mod go.sum ./
ENV GODEBUG=netdns=go
RUN go mod download
COPY . .
RUN go build -o api ./cmd/api

FROM golang:1.20
WORKDIR /app
COPY --from=builder /app/api ./api
EXPOSE 8081
ENTRYPOINT ["./api"]
