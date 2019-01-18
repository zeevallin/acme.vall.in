#!/bin/sh
ACME_PATH=$1
docker run --rm --name acmedns \
    -p 53:53 \
    -p 53:53/udp \
    -p 80:80 \
    -v $ACME_PATH/config:/etc/acme-dns:ro \
    -v $ACME_PATH/data:/var/lib/acme-dns  \
    -d joohoi/acme-dns
