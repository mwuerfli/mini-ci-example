# Build stage
FROM golang:1.24 AS builder

WORKDIR /app

COPY go.mod ./
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o demo .

# Run stage
FROM scratch

COPY --from=builder /app/demo /demo

ENTRYPOINT ["/demo"]
