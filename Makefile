.DEFAULT_GOAL := help

CMS_FOLDER=./cms

wordpress-up: ## Wordpress up on http://localhost:8080/
	cd $(CMS_FOLDER)/wordpress && $(MAKE) down && $(MAKE) up

wordpress-down: ## Wordpress down
	cd $(CMS_FOLDER)/wordpress && $(MAKE) down

drupal-up: ## Drupal up on http://localhost:8081/
	cd $(CMS_FOLDER)/drupal && $(MAKE) down && $(MAKE) up

drupal-down: ## Drupal down
	cd $(CMS_FOLDER)/drupal && $(MAKE) down

all-up: ## Bring up all defined CMS
	$(MAKE) drupal-up
	$(MAKE) wordpress-up

all-down: ## Bring down all defined CMS
	$(MAKE) drupal-down
	$(MAKE) wordpress-down

help:
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "# Makefile targets                                                                 |"
	@printf "\033[37m%-30s\033[0m %s\n" "#----------------------------------------------------------------------------------"
	@printf "\033[37m%-30s\033[0m %s\n" "#-target-----------------------description-----------------------------------------"
	@grep -E '^[a-zA-Z_-].+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
