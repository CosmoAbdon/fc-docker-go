# STAGE 1 - Building
FROM golang:1.19-alpine AS builder
WORKDIR /app
COPY hello.go .
RUN go build hello.go

# STAGE 2 - Run PROD
FROM scratch
WORKDIR /app
COPY --from=builder /app/hello .
CMD ["./hello"]