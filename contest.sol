pragma solidity ^0.4.0;
contract contest{
    address owner;
    uint public tickets;
    uint constant price=1 ether;
    
    //this mapping creates an array which contains the buyers records
    mapping(address => uint)public buyers;
    
    function contest(uint t){
        owner=msg.sender;
        tickets=t;
    }
    function() payable{      
        buyTickets(1);
        
    }
    function buyTickets(uint amount) payable{
        if (msg.value != (amount * price) || amount > tickets){
        throw;
        }    
        buyers[msg.sender] += amount;
        tickets -= amount;
    
        if( tickets == 0){
        selfdestruct(owner);
        }
    }
    
}
