//SPDX-License-Identifier:MIT

pragma solidity 0.8.26;

import {ERC20Burnable, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/*
 * @title DOLA
 * @author KK
 * Collateral: Exogenous(ETH & BTC)
 * Minting: Algorithmic
 * Relative Stability: Pegged to USD
 * This is the contract meant to be governed by DOLAEngine. This contract is just the ERC20 implementation of our DOLA system.
 */
contract DOLA is ERC20Burnable, Ownable {
    error DOLA_AmountMustBeMoreThanZero();
    error DOLA_BalanceMustBeGreaterThanAmount();
    error DOLA_ZeroAddress();

    constructor() ERC20("DOLA", "DL") Ownable(msg.sender) {}

    function mint(
        address _to,
        uint256 _amount
    ) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DOLA_ZeroAddress();
        }
        if (_amount <= 0) {
            revert DOLA_AmountMustBeMoreThanZero();
        }
        _mint(_to, _amount);
        return true;
    }

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) {
            revert DOLA_AmountMustBeMoreThanZero();
        }
        if (_amount < balance) {
            revert DOLA_BalanceMustBeGreaterThanAmount();
        }

        super.burn(_amount);
    }
}
