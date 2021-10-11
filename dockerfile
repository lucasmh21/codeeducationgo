FROM golang:1.17-alpine as build
COPY . /app
WORKDIR /app
RUN go build main.go
ENTRYPOINT [ "./main" ]

FROM scratch
COPY --from=build /app/main .
ENTRYPOINT [ "./main" ]
