# Understanding Pseudorandomness in Blockchain: CoiunFlip

Ethernaut's CoinFlip is a contract that is supposed to create a fair random game. However, with knowledge of public variables like the block number, we can predict the results of the pseudo-random number generator and always win the game.

## The Script

The script defines an `Exploit` contract that takes advantage of the predictability of pseudorandom numbers in the `CoinFlip` contract. The `CoinFlip` contract uses the blockhash of the previous block to generate a pseudorandom number.

The `Exploit` contract calculates the same pseudorandom number by using the same blockhash and a constant `FACTOR`. It then uses this number to predict the result of the `flip` function in the `CoinFlip` contract.

## The Problem with Pseudorandom Numbers in Blockchain

In blockchain, each block's data, including the blockhash, is deterministic and publicly available. This means that anyone can calculate the blockhash of a particular block. If a contract uses the blockhash to generate a pseudorandom number, anyone can predict that number.

This predictability can be exploited. In the case of the `CoinFlip` contract, an attacker can use the `Exploit` contract to always win the coin flip.

## Security Considerations

When developing smart contracts that require randomness, it's crucial to consider the security implications of the method used to generate random numbers.

1. **Predictability**: As demonstrated by the `Exploit` contract, using deterministic and publicly available data like the blockhash to generate random numbers can lead to predictability. This can be exploited by attackers to manipulate the outcome in their favor.

2. **Manipulation**: Miners, who have control over the blockhash, could potentially manipulate the outcome if the stakes are high enough. This is known as miner front-running.

3. **Reliability**: Chainlink VRF, while providing a secure and verifiable source of randomness, relies on external oracle nodes. The reliability of these nodes and the network latency can impact the performance and security of your contract.

4. **Gas Costs**: Requesting randomness from Chainlink VRF consumes more gas than using the blockhash. This is due to the overhead of the oracle network and the cryptographic operations involved in generating and verifying the random number.

Therefore, always consider the security implications and trade-offs when choosing a method for generating random numbers in your smart contracts.

To run the script, use the following command:

```shell
forge script script/Fallback.s.sol --rpc-url https://rpc.sepolia.org --broadcast
```
