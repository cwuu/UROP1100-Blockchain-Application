pragma solidity ^0.4.0;

contract MyContract
{
    mapping(address => uint256) amount;
    mapping(address => bool)isAdmin;
    
    uint m = 0;
    uint v = 0;
    function testing (uint x)
    {
        for(uint i=0;i<x;i++)
            m+=i;
        for(uint j=0;j<x;i++)
            v+=j;
        
    }
    
    function testing1 (uint x)
    {
        for(uint i=0;i<x;i++)
        {
            m+=i;
            v+=i;
        }

        
    }

}
