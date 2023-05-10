FROM alpine:3.18

RUN apk add --no-cache jq

COPY run.sh /

CMD ["/run.sh"]
