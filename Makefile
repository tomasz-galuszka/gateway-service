VERSION := 1.0.8

# BUILD SECTION
build:
	docker build -t ghcr.io/tomasz-galuszka/gateway:$(VERSION)-local -t ghcr.io/tomasz-galuszka/gateway:latest-local .
build-certbot:
	docker build -t ghcr.io/tomasz-galuszka/certbot:$(VERSION)-local -t ghcr.io/tomasz-galuszka/certbot:latest-local ./docker/certbot

build-remote:
	docker build -t ghcr.io/tomasz-galuszka/gateway:$(VERSION)$(TAG_SUFFIX) -t ghcr.io/tomasz-galuszka/gateway:latest$(TAG_SUFFIX) .
	docker login https://ghcr.io --username=$(REPOSITORY_USER) --password=$(REPOSITORY_PASSWORD)
	docker push ghcr.io/tomasz-galuszka/gateway:$(VERSION)$(TAG_SUFFIX)
	docker push ghcr.io/tomasz-galuszka/gateway:latest$(TAG_SUFFIX)
build-certbot-remote:
	docker build -t ghcr.io/tomasz-galuszka/certbot:$(VERSION)$(TAG_SUFFIX) -t ghcr.io/tomasz-galuszka/certbot:latest$(TAG_SUFFIX) ./docker/certbot
	docker login https://ghcr.io --username=$(REPOSITORY_USER) --password=$(REPOSITORY_PASSWORD)
	docker push ghcr.io/tomasz-galuszka/certbot:$(VERSION)$(TAG_SUFFIX)
	docker push ghcr.io/tomasz-galuszka/certbot:latest$(TAG_SUFFIX)

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
	docker run -it --rm --name certbot -v ${PWD}/docker/certbot:/letsencrypt -v ${PWD}/docker/certbot/certs:/etc/letsencrypt ghcr.io/tomasz-galuszka/certbot:latest-local bash
stop:
	docker-compose -f ./docker/docker-compose.yml down