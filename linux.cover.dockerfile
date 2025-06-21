FROM golang:1.17

WORKDIR /go/src/github.com/oneclickvirt/times
COPY . .

RUN GO111MODULE=auto go test -covermode=count -coverprofile=profile.cov
