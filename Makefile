.PHONY: build compile test

include .env

build:; forge build

compile:; forge compile

test:
	forge test
