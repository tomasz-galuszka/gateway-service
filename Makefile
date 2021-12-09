VERSION := 0.0.1-SNAPSHOT

# BUILD SECTION
build:
	docker build -t ghcr.io/tomasz-galuszka/gateway-service:$(VERSION)-local -t ghcr.io/tomasz-galuszka/gateway-service:latest-local .
build-certbot:
	docker build -t ghcr.io/tomasz-galuszka/certbot-job:$(VERSION)-local -t ghcr.io/tomasz-galuszka/certbot-job:latest-local ./docker/certbot

# TEST SECTION
test:
	@curl http://tematzycie.pl
	@echo ""
	@curl http://blog.xmanager.ovh
	@echo ""
	@curl http://webspider.xmanager.ovh
	@echo ""
	@curl http://xmanager.ovh
# START SECTION
start:
	docker-compose -f ./docker/docker-compose.yml up -d
start-certbot:
	docker run -it --rm --name certbot -v ${PWD}/docker/certbot:/letsencrypt -v ${PWD}/docker/certbot/certs:/etc/letsencrypt ghcr.io/tomasz-galuszka/certbot-job:latest-local bash
stop:
	docker-compose -f ./docker/docker-compose.yml down