# Dockerfile for setup tasks
FROM alpine:latest
RUN apk add --no-cache curl jq
COPY setup /scripts
WORKDIR /scripts
CMD ["sh", "setup.sh"]
