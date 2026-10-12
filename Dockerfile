FROM alpine:latest
WORKDIR /app
COPY . /app
EXPOSE 7777/udp
CMD ["./samp03svr"]
