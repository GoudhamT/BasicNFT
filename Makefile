.PHONY: build compile test install

include .env

install:
	forge install OpenZeppelin/openzeppelin-contracts
	forge install Cyfrin/foundry-devops
	remappings > remappings.txt

build:; forge build

compile:; forge compile

test:
	forge test

deploy-sepolia:
	forge script script/DeployBasicNFT.s.sol:DeployBasicNFT --rpc-url $(SEPOLIA_RPC_URL) --private-key $(SEPOLIA_PRIVATE_KEY) --broadcast

mint-sepolia:
	forge script script/Interactions.s.sol:BasicNFTInteractions --rpc-url $(SEPOLIA_RPC_URL) --private-key $(SEPOLIA_PRIVATE_KEY) --broadcast
	