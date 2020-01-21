FROM alpine:3.11

RUN apk add curl && \
    curl -o /usr/local/bin/kubectl -LO https://storage.googleapis.com/kubernetes-release/release/v1.17.1/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    curl -o doctl.tar.gz -OL https://github.com/digitalocean/doctl/releases/download/v1.37.0/doctl-1.37.0-linux-amd64.tar.gz && \
    tar xf doctl.tar.gz && \
    rm doctl.tar.gz && \
    mv /doctl /usr/local/bin/doctl
