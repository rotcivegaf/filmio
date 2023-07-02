// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/StdUtils.sol" ;
import { FilmioProjectV1 } from "src/Project/FilmioProjectV1.sol";

contract PoCOnlyOwner is Test {
    address owner = address(1);
    address aWallet = address(123424312);

    function testAnyoneCanCreateLock() public {
        // Deploy the Contract
        vm.prank(owner);
        FilmioProjectV1 filmio = new FilmioProjectV1();

        // Anyone can create a lock with at arbitrary `projectId`
        vm.prank(aWallet);
        filmio.createLock("Foo");
    }
}