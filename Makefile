VERSION := 0.0.1-SNAPSHOT

build:
	docker build --rm -t ghcr.io/tomasz-galuszka/gateway-service:$(VERSION)-local -t ghcr.io/tomasz-galuszka/gateway-service:latest-local .

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
	docker-compose -f ./docker/docker-compose.yml up
stop:
	docker-compose -f ./docker/docker-compose.yml down