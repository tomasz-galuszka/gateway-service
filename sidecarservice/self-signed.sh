#!/usr/bin/env bash

BASE_PATH=/Users/tomasz.galuszka/development/github/priv/gateway-service/infrastructure/etc/letsencrypt/live
DOMAIN=tematzycie.pl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${BASE_PATH}/${DOMAIN}/example.key -out ${BASE_PATH}/${DOMAIN}/example.crt