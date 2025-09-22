#!/bin/bash

envsubst < /etc/nginx/conf.d/upstream.template.conf > /etc/nginx/conf.d/upstream.conf && nginx -g 'daemon off;'