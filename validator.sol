pragma solidity ^0.4.0;
contract AccountValidator {
    
    address public owner = msg.sender;             //msg.sender is the address where the current function call came from
    
    function validate(address addr) constant returns (bool) {         //getter to display if an address is owner or not,returns true or false
        return addr == owner;
    }
    
    function setOwner(address owner_) {            //setter to set another address as owner 
        if(msg.sender == owner)
           owner = owner_;
    }
    
}
 

/* 

Using this contract we cannot change the fields of above contract.
The code of the AccountValidator contract can't be changed anymore. 
very simple and powerful solution of this problem is- Abstract functions.

contract DataExternalValidation {
    
    uint public data;

    AccountValidator _validator;

    function DataExternalValidation2(address validator) returns (address){
        _validator = AccountValidator(validator);
        return _validator; 
    }

    function addData(uint data_) {
        if(_validator.validate(msg.sender))
            data = data_;
    }
    
    function setValidator(address validator) {
        if(_validator.validate(msg.sender))
            _validator = AccountValidator(validator);
    }
}

*/
contract AccountValidator1 {
    function validate(address addr) constant returns (bool);        //abstract function
}


contract SingleAccountValidator is AccountValidator1
    
    address public owner = msg.sender;                      //to store single address value
    
    function validate(address addr) constant returns (bool) {         
        return addr == owner;
    }
    
    function setOwner(address owner_) {
        if(msg.sender == owner)
            owner = owner_;
    }
    
}

contract MultiAccountValidator is AccountValidator {           //AccountValidator is inherited in this contract
    
    mapping(address => bool) public owners;               //this mapping maintains the list of multiple addresses gives true or false as output
    
    function MultiAccountValidator() {
        owners[msg.sender] = true;
    }
    
    function validate(address addr) constant returns (bool) {
        return owners[addr];
    }
    
    function addOwner(address addr) {
        if(owners[msg.sender])
            owners[addr] = true;
    }
}
