FROM ubuntu:24.04

RUN apt update
RUN apt install -y nginx
RUN apt install -y curl
RUN apt install -y gettext
RUN useradd -M -r -U   nginx

RUN ls /etc/nginx/

COPY config /etc/nginx

COPY entrypoint.sh /etc/nginx
RUN chmod +x /etc/nginx/entrypoint.sh

EXPOSE 80
# CMD ["cat", "/etc/nginx/conf.d/upstream.conf"]
# CMD ["nginx", "-g", "daemon off;"]

ENTRYPOINT [ "/etc/nginx/entrypoint.sh" ]