#!/bin/sh
curl -s -X POST https://acme.vall.in/register $1 | jq
