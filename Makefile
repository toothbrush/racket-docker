SHELL = /bin/bash
OWNER_TEAM = delivery-engineering
PROJECT_NAME = racket-docker
IMAGE_NAME = redbubble/${PROJECT_NAME}
DEPLOY_ENV ?= staging

build: ## Create the docker image.
	@echo "--- :wind_chime: Building :wind_chime:"
	-docker image pull ${IMAGE_NAME}:master
	docker image build --pull \
		--cache-from ${IMAGE_NAME}:master \
		--tag ${IMAGE_NAME}:latest .

test: ## Run the app tests.
	@echo "--- :fire: Testing :fire:"
	docker image build --pull \
		--cache-from ${IMAGE_NAME}:master \
		--file Dockerfile.test .

all: test build
