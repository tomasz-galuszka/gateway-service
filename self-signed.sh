#!/usr/bin/env bash

BASE_PATH=./infrastructure/etc/letsencrypt/live
DOMAIN=$1

mkdir -p ${BASE_PATH}/${DOMAIN}
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${BASE_PATH}/${DOMAIN}/privkey.pem -out ${BASE_PATH}/${DOMAIN}/fullchain.pem