help: ## Prints this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

backend-setup: ## setup backend environment
	cd backend && script/setup
backend-server: ## Start backend docker-compose
	cd backend && script/server
backend-bash: ## Run bash in docker server
	cd backend && script/bash
backend-test: ## Run backend test
	cd backend && script/test
backend-clean: ## Down backend docker compose
	cd backend && script/clean
frontend-up: ## Down start docker compose
	cd frontend && docker-compose up --build
frontend-stop: ## Down stop docker compose
	cd frontend && docker-compose stop