FROM golang:1.20 AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o api ./cmd/api

FROM scratch
WORKDIR /
COPY --from=builder /app/api /api
EXPOSE 8081
ENTRYPOINT ["/api"]
