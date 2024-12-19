### ERC20

- Manual Implementation
- OpenZeppelin implementation
  
## Quickstart

```
git clone https://github.com/056xyz/ERC20.git
cd ERC20
make install 
make build
```


## Start a local node

```
make anvil
```

## Deploy

This will default to your local node. You need to have it running in another terminal in order for it to deploy.

```
make deploy
```

## Testing

```
forge test
```

or 

```
forge test --fork-url $SEPOLIA_RPC_URL
```


## Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file.

- `PRIVATE_KEY`: The private key of your account.
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from Alchemy.


2. Get testnet ETH


3. Deploy 

```
make deploy ARGS="--network sepolia"
```


## Scripts

After deploy to a testnet or local net, you can run the scripts. 

Using cast deployed locally example: 
```
cast send <ERC20_CONTRACT_ADDRESS> "transfer(address,uint256)" <ADDRESS_TO> 0.1ether --private-key <PRIVATE_KEY> 
```
<!-- Anvil -->
<!-- cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "transfer(address,uint256)" 0x70997970C51812dc3A010C7d01b50e0d17dc79C8  0.1ether --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80  -->