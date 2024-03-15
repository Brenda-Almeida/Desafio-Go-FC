FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD [ "./main" ]

