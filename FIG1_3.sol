pragma solidity ^0.4.0;

//Fig 1-3 . Examination of using contract as a data storage
contract MyContract
{
    mapping(address => uint256) amount;
    mapping(address => bool)isAdmin;
}

contract User
{
    uint public amount;
    bool public isAdmin;
    function User(uint256 _amount, bool _isAdmin)
    {
        amount = _amount;
        isAdmin = _isAdmin;
    }
}
