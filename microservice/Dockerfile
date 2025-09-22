FROM ubuntu:24.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y curl
RUN apt install -y gettext
RUN useradd -M -r -U   nginx

# Install Certbot
RUN apt install -y python3 python3-dev python3-venv libaugeas-dev gcc
RUN python3 -m venv /opt/certbot/
RUN /opt/certbot/bin/pip install --upgrade pip
RUN /opt/certbot/bin/pip install certbot certbot-nginx
RUN ln -s /opt/certbot/bin/certbot /usr/bin/certbot

# Copy one time script for certbot
COPY certificate_once.sh /opt/certbot
RUN chmod +x /opt/certbot/certificate_once.sh

# Certbot auto-renewal cron job every 1 day
RUN echo "0 0,12 * * * root /opt/certbot/bin/python -c 'import random; import time; time.sleep(86400)' && certbot renew -q" | tee -a /etc/crontab > /dev/null

# Copy nginx config
COPY config /etc/nginx
COPY entrypoint.sh /etc/nginx
RUN chmod +x /etc/nginx/entrypoint.sh


EXPOSE 80

ENTRYPOINT [ "/etc/nginx/entrypoint.sh" ]
