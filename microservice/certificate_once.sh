#!/bin/bash

certbot certonly --webroot -w /etc/letsencrypt --non-interactive --email tomgal144@gmail.com --agree-tos --no-eff-email -d tematzycie.pl
certbot certonly --webroot -w /etc/letsencrypt --non-interactive --email tomgal144@gmail.com --agree-tos --no-eff-email -d tech.tematzycie.pl
certbot certonly --webroot -w /etc/letsencrypt --non-interactive --email tomgal144@gmail.com --agree-tos --no-eff-email -d expensemanager.site
certbot certonly --webroot -w /etc/letsencrypt --non-interactive --email tomgal144@gmail.com --agree-tos --no-eff-email -d splanet.store