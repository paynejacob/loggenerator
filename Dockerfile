FROM goland:1.14.4-alpine3.12 as build
WORKDIR /go/src/loggenerator
COPY . .
RUN go build -o loggenerator main.go

FROM alpine:3.12
COPY --from=gobuild /go/src/loggenerator/loggenerator /usr/local/bin/loggenerator
ENTRYPOINT ["loggenerator"]