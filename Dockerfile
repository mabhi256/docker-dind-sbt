FROM openjdk:8-jre-alpine

ARG SBT_VERSION=1.2.8

# Install sbt
RUN \
    apk update && \
    apk add --no-cache bash curl bc ca-certificates && \
    update-ca-certificates && \
    curl -fsL https://github.com/sbt/sbt/releases/download/v$SBT_VERSION/sbt-$SBT_VERSION.tgz | tar xfz - -C /usr/local && \
    ln -s /usr/local/sbt/bin/* /usr/local/bin/ && \
    sbt sbtVersion && \
    apk del curl

# Install docker
RUN apk add --no-cache docker
