// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OZToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("OZToken", "OZT") {
        _mint(msg.sender, initialSupply);
    }
}
