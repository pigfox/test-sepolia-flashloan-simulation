// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000 * 10 ** uint(decimals()));  // Mint 1000 tokens to the deployer for initial supply
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
