// SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

import "./ERC20.sol";

contract CryptizenToken is ERC20 {
  constructor() ERC20("Cryptizen", "CTZ", 18) {
    uint256 totalTokens = 1000000000 * 10 **uint256(decimals());
    _mint(msg.sender, totalTokens);
  }

  function burn(uint256 amount) external {
    _burn(msg.sender, amount);
  }

  function burnFrom(address account, uint256 amount) public virtual {
    uint256 currentAllowance = allowance(account, _msgSender());
    require(currentAllowance >= amount, "ERC20: burn amount exceeds allowance");
    unchecked {
        _approve(account, _msgSender(), currentAllowance - amount);
    }
    _burn(account, amount);
  }
}