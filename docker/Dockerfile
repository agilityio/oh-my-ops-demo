FROM ubuntu:18.04

RUN apt-get update && \
    # Install common
    apt-get install -y curl wget git docker

WORKDIR /app
ADD entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]

