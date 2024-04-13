# Ethernaut Security Demonstrations with Foundry

This repository is dedicated to demonstrating security best practices in Ethereum smart contracts. We use [Ethernaut](https://ethernaut.openzeppelin.com/) problems as practical examples to illustrate common vulnerabilities and how to avoid them.

## About Foundry

We use [Foundry](https://github.com/gakonst/foundry), a blazing fast, portable, and modular toolkit for Ethereum application development written in Rust. Foundry consists of:

- **Forge**: An Ethereum testing framework similar to Truffle, Hardhat, and DappTools.
- **Cast**: A Swiss army knife for interacting with EVM smart contracts, sending transactions, and getting chain data.
- **Anvil**: A local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: A fast, utilitarian, and verbose Solidity REPL.

## Getting Started

To get started with this repository, you'll need to install Foundry. You can do this with the following command:

```shell
$ cargo install --git https://github.com/gakonst/foundry --branch main
```

Once Foundry is installed, you can build the project with:

```shell
$ forge build
```

And run the tests with:

```shell
$ forge test
```

## Contributing

We welcome contributions! Please feel free to submit pull requests with solutions to additional Ethernaut problems or improvements to existing solutions.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
