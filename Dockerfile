FROM alpine:3.16

RUN apk add --no-cache jq

COPY run.sh /

CMD ["/run.sh"]
