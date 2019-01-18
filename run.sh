#!/bin/sh
ACME_PATH=$1
docker build $ACME_PATH --rm --name acmedns \
    -p 53:53 \
    -p 53:53/udp \
    -p 80:80 \
    -v $ACME_PATH/config:/etc/acme-dns:ro \
    -v $ACME_PATH/data:/var/lib/acme-dns  \
    -v $ACME_PATH/certs:/var/certs  \
    -d joohoi/acme-dns
