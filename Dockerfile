FROM node:12-alpine

LABEL maintainer="realanmup@gmail.com"

ENV PYTHONUNBUFFERED=1

RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi

RUN apk add curl unzip jq

RUN pip3 install --upgrade awscli

RUN curl https://releases.hashicorp.com/terraform/0.12.19/terraform_0.12.19_linux_amd64.zip > terraform.zip
RUN unzip terraform.zip -d /usr/local/bin
