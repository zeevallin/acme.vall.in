#!/bin/sh
ACME_PATH=$1
docker build $ACME_PATH -t zeeraw/acme.vall.in:latest
docker run --rm --name acmedns \
    -u 500:500 \
    -p 53:53 \
    -p 53:53/udp \
    -p 80:80 \
    -p 443:443 \
    -v $ACME_PATH/config:/etc/acme-dns:ro \
    -v $ACME_PATH/data:/var/lib/acme-dns \
    -v $ACME_PATH/certs:/var/certs \
    -d zeeraw/acme.vall.in:latest
