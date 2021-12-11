#!/usr/bin/env bash

BASE_PATH=/Users/tomasz.g/Development/github/gateway-service/docker/certbot/certs/live
DOMAIN=webspider.xmanager.ovh
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${BASE_PATH}/${DOMAIN}/example.key -out ${BASE_PATH}/${DOMAIN}/example.crt