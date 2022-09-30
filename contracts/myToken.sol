pragma solidity ^0.8.5;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol';

contract AITU_Rakhymzhan is ERC20 {
    address public admin;
    constructor() ERC20('My Token', 'MTN'){
        _mint(msg.sender, 10000 * 10 ** 10);
        admin = msg.sender;
    }

    function mint(address to, uint amount) external {
        require(msg.sender == admin, 'only admin');
        _mint(to, amount);
    }

    function burn(uint amount) external {
        _burn(msg.sender, amount);
    }

    function myTransfer(address to, uint amount) external {
        address owner = _msgSender();
        _transfer(owner, to, amount);
    }

    function myTransferFrom(address from, address to, uint amount) external {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
    }
}
