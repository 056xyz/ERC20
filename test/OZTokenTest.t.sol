// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test} from "forge-std/Test.sol";
import {DeployOZToken} from "../script/DeployOZToken.s.sol";
import {OZToken} from "../src/OZToken.sol";

contract OZTokenTest is Test {
    OZToken public ozToken;
    DeployOZToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployOZToken();
        ozToken = deployer.run();

        vm.prank(msg.sender);
        ozToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, ozToken.balanceOf(bob));
    }

    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000;

        vm.prank(bob);
        ozToken.approve(alice, initialAllowance);

        uint256 transferAmount = 500;

        vm.prank(alice);
        ozToken.transferFrom(bob, alice, transferAmount);

        // ozToken.transfer(alice, transferAmount);

        assertEq(ozToken.balanceOf(alice), transferAmount);
        assertEq(ozToken.balanceOf(bob), STARTING_BALANCE - transferAmount);
    }

    function testTransfer() public {
        uint256 amount = 1000;
        address receiver = address(0x1);
        vm.prank(msg.sender);
        ozToken.transfer(receiver, amount);
        assertEq(ozToken.balanceOf(receiver), amount);
    }

    function testBalanceAfterTransfer() public {
        uint256 amount = 1000;
        address receiver = address(0x1);

        uint256 initialBalance = ozToken.balanceOf(msg.sender);
        vm.prank(msg.sender);
        ozToken.transfer(receiver, amount);

        assertEq(ozToken.balanceOf(msg.sender), initialBalance - amount);
    }
}
