VERSION := latest-local

# BUILD SECTION
version:
	$(info  $(VERSION))

build:
	docker build -t ghcr.io/tomasz-galuszka/gateway:$(VERSION)-local -t ghcr.io/tomasz-galuszka/gateway:latest-local --output type=docker ./microservice
build-sidecar:
	docker build -t ghcr.io/tomasz-galuszka/certbot:$(VERSION)-local -t ghcr.io/tomasz-galuszka/certbot:latest-local --output type=docker ./sidecarservice

build-remote:
	docker build -t ghcr.io/tomasz-galuszka/gateway:$(VERSION) -t ghcr.io/tomasz-galuszka/gateway:latest ./microservice
	docker login https://ghcr.io --username=$(REPOSITORY_USER) --password=$(REPOSITORY_PASSWORD)
	docker push ghcr.io/tomasz-galuszka/gateway:$(VERSION)
	docker push ghcr.io/tomasz-galuszka/gateway:latest
build-sidecar-remote:
	docker build -t ghcr.io/tomasz-galuszka/certbot:$(VERSION) -t ghcr.io/tomasz-galuszka/certbot:latest ./sidecarservice
	docker login https://ghcr.io --username=$(REPOSITORY_USER) --password=$(REPOSITORY_PASSWORD)
	docker push ghcr.io/tomasz-galuszka/certbot:$(VERSION)
	docker push ghcr.io/tomasz-galuszka/certbot:latest

# START SECTION
start:
	docker compose -f ${PWD}/infrastructure/docker-compose.yml up -d
stop:
	docker compose -f ${PWD}/infrastructure/docker-compose.yml down  --remove-orphans
start-certbot:
	docker run -it --rm --name certbot -v ${PWD}/sidecarservice:/letsencrypt -v ${PWD}/sidecarservice/certs:/etc/letsencrypt ghcr.io/tomasz-galuszka/certbot:latest-local bash

# TEST SECTION
test:
	@curl -kL http://expensemanager.site
	@echo ""
	@curl -kL http://tematzycie.pl
	@echo ""
	@curl -kL http://tech.tematzycie.pl
	@echo ""