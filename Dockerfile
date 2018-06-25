FROM alpine:3.6 AS BUILD

WORKDIR /kms

RUN apk add --no-cache git build-base && \
  git clone https://github.com/Wind4/vlmcsd.git . && \
  make

FROM alpine:3.6

WORKDIR /kms

COPY --from=BUILD /kms/bin .

EXPOSE 1688/tcp

CMD [ "./vlmcsd", "-Ded", "-t5" ]