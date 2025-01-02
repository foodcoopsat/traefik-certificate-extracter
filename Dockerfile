FROM alpine:3.21

RUN apk add --no-cache jq docker

COPY run.sh /

CMD ["/run.sh"]
