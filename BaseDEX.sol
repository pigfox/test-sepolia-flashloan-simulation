// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract BaseDEX {
    IERC20 public token;

    constructor() {}

    function addTokens(address tokenAddress) public {
        token = IERC20(tokenAddress);
    }

    function depositTokens(uint256 amount) public {
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");
    }

    function getBalance() public view returns (uint256) {
        return token.balanceOf(address(this));
    }
}
