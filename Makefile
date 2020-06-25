.DEFAULT_GOAL := help

wordpress-up: ## Wordpress up
	cd ./wordpress && $(MAKE) down && $(MAKE) up

wordpress-down: ## Wordpress down
	cd ./wordpress && $(MAKE) down

drupal-up: ## Drupal up
	cd ./drupal && $(MAKE) down && $(MAKE) up

drupal-down: ## Drupal down
	cd ./drupal && $(MAKE) down

help:
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "# Makefile targets                                                                 |"
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "#-target-----------------------description-----------------------------------------"
	@grep -E '^[a-zA-Z_-].+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
