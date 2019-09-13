FROM alpine:3.10

# install dependencies
RUN apk update && \
	apk add wget curl gzip tar --no-cache > /dev/null && \
	rm -rf /var/cache/apk/*

# set env
ENV HELM_VERSION=v2.14.0

WORKDIR /app

# install helm
RUN curl -o helm-linux-amd64.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz > /dev/null && \
    tar -zxvf helm-linux-amd64.tar.gz && \
    chmod +x linux-amd64/helm && \
    mv linux-amd64/helm /usr/local/bin/ && \
    rm -rf linux-amd64 helm-linux-amd64.tar.gz

RUN helm init --client-only