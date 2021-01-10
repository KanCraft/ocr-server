FROM debian:bullseye-slim

LABEL maintainer="otiai10 <otiai10@gmail.com>"

RUN apt update \
    && apt -qq -y install \
      ca-certificates \
      libtesseract-dev=4.1.1-2+b1 \
      tesseract-ocr=4.1.1-2+b1 \
      golang=2:1.15~1

ENV GO111MODULE=on
ENV GOPATH=${HOME}/go
ENV PATH=${PATH}:${GOPATH}/bin

ADD . $GOPATH/src/github.com/KanCraft/ocr-server
WORKDIR $GOPATH/src/github.com/KanCraft/ocr-server
RUN go get -v ./... && go install .

ENV PORT=8080
CMD ["ocr-server"]
