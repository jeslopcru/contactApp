help: ## Prints this help.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

current-dir := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

setup: ## setup environment
	cd backend && script/setup
server: ## Start all docker-compose
	cd backend && script/server
bash: ## Run bash in docker server
	cd backend && script/bash
test: ## Run test
	cd backend && script/test
clean: ## Down all docker compose
	cd backend && script/clean
