FROM golang:alpine

WORKDIR /app

COPY . .
RUN go mod init dispatcher && \
    go mod tidy && \
    go build

EXPOSE 80

CMD ["./dispatcher"]
