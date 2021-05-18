.PHONY: help build run bash run
default: help

help:
	@echo '>make help 				/ this screen'
	@echo '>make build				/ Docker build command'
	@echo '>make bash				/ runs plain ole bash'
	@echo '>make zsh				/ runs oh-my-zsh shell'

build:
	docker build -t og_platform_eng .

bash: build
	docker run -v $(CURDIR):/host -v ~/.aws:/root/.aws -it og_platform_eng:latest bash

run: build
	docker run -v $(CURDIR):/host -v ~/.aws:/root/.aws -it og_platform_eng:latest /bin/zsh