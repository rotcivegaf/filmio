// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/StdUtils.sol" ;
import { FilmioProjectV1 } from "src/Project/FilmioProjectV1.sol";

contract PoC is Test {
    address owner = address(1);

    function test() public {
        // Deploy the Contract
        vm.prank(owner);
        FilmioProjectV1 filmio = new FilmioProjectV1();
    }
}