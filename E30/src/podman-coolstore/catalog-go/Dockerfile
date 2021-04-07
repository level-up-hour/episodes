FROM registry.access.redhat.com/ubi8/go-toolset:1.12.8-18.15771109271 as builder
USER root
WORKDIR /go/src/app
COPY . /go/src/app
RUN go get -d -v ./...
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -gcflags "-N -l" -ldflags="-compressdwarf=false" -o catalog-go .

FROM ubi8-minimal
COPY --from=builder /go/src/app /app
WORKDIR /app
EXPOSE 8090
CMD ["/app/catalog-go"]