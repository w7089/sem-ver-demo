# Project variables
ORG_NAME ?= warrior7089
REPO_NAME := $(shell basename `pwd`)

# Use these settings to specify a custom Docker registry
DOCKER_REGISTRY ?= docker.io

.PHONY: docker-build login logout publish

docker-build:
	${INFO} "Building docker image..."
	@ docker build  -t $(DOCKER_REGISTRY)/$(ORG_NAME)/$(REPO_NAME):latest .
	${INFO} "Build complete"

login:
	${INFO} "Logging in to Docker registry $$DOCKER_REGISTRY..."
	@ docker login -u $$DOCKER_USER -p $$DOCKER_PASSWORD
	${INFO} "Logged in to Docker registry $$DOCKER_REGISTRY"

logout:
	${INFO} "Logging out of Docker registry $$DOCKER_REGISTRY..."
	@ docker logout
	${INFO} "Logged out of Docker registry $$DOCKER_REGISTRY"	

publish:
	${INFO} "Publishing image to $(DOCKER_REGISTRY)/$(ORG_NAME)/$(REPO_NAME)..."
	docker push $(DOCKER_REGISTRY)/$(ORG_NAME)/$(REPO_NAME):latest
	${INFO} "Publish complete"
	
# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
  printf $(YELLOW); \
  echo "=> $$1"; \
  printf $(NC)' SOME_VALUE
