ARG BASE_BUILDER_IMAGE="golang:alpine"\
    BASE_IMAGE="alpine"\
    RELEASE_TAG="master"

FROM ${BASE_BUILDER_IMAGE} as builder

RUN apk add --no-cache\
    git\
    make\
 && git clone --branch ${RELEASE_TAG} --single-branch --depth 1 https://github.com/lightningnetwork/lnd /go/src/github.com/lightningnetwork/lnd\
 && cd /go/src/github.com/lightningnetwork/lnd\
 && make\
 && make install

FROM ${BASE_IMAGE}

VOLUME /root/.lnd

RUN apk --no-cache add ca-certificates

COPY --from=builder /go/bin/lncli /bin/
COPY --from=builder /go/bin/lnd /bin/

ENTRYPOINT ["lnd"]
CMD ["--help"]
