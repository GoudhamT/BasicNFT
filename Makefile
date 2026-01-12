.PHONY: build compile test install

include .env

build:; forge build

compile:; forge compile

test:
	forge test

install:
	forge install OpenZeppelin/openzeppelin-contracts
	forge install Cyfrin/foundry-devops
	remappings > remappings.txt
	