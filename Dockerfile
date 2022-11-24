FROM alpine:3.17

RUN apk add --no-cache jq

COPY run.sh /

CMD ["/run.sh"]
