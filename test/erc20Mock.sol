// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import {ERC20} from "solady/src/tokens/ERC20.sol";

contract ERC20Mock is ERC20 {
    string internal _name;
    string internal _symbol;
    uint8 internal _decimals;
    bytes32 internal immutable _nameHash;

    constructor() {
        _name = "MOCK ERC20";
        _symbol = "MockERC";
        _decimals = 18;
        _nameHash = keccak256(bytes(_name));
    }

    function mint(address _to, uint256 _amount) public {
        _mint(_to, _amount);
    }

    function burn(address account, uint256 amount) external {
        _burn(account, amount);
    }

    function _constantNameHash() internal view virtual override returns (bytes32) {
        return _nameHash;
    }

    function name() public view virtual override returns (string memory) {
        return _name;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }
}
