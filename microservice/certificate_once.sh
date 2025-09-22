#!/bin/bash

# /opt/certbot/certificate_once.sh inside gateway-service container
certbot certonly --nginx --non-interactive --agree-tos --email tomgal144@gmail.com -d tematzycie.pl -d tech.tematzycie.pl -d expensemanager.site 