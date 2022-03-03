# Docker images
.PHONY: image-development
docker-development:
	docker-compose run development /bin/bash

.PHONY: image-test
docker-test:
	docker-compose up test --build
