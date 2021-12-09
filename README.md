### Gateway service
Multi domain proxy with SSL and 80 port
![](./diagram.png)

https://www.youtube.com/watch?v=jrR_WfgmWEw
#### Certbot
* domain must point to the server
  * start domain validation process
    * use certbot utility run on our server to prove we own domain
    * certbot will request certificate challenge from letsencrypt
    * letsencrypt will ask to place a file behind http://<domain>/.well-known/acme-challenge/
      * certbot will generate a file and sign the nonce from lets encrypt
      * letsencrypt will validate tehe file
      * certificate will be issued to certbot
    ```
      make start-certbot
      certbot certonly --webroot -w /letsencrypt --email tomgal144@gmail.com --agree-tos --no-eff-email --non-interactive -d xmanager.ovh
    ```
  * update nginx configuration to use certificates obtained by certbot
  * create cronjob for renewal
    * run `make start-certbot  >> certbot --renew`
    * reload nginx configuration `docker exec -it gateway-container nginx -s reload`