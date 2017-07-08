pragma solidity ^0.4.0;

library LibraryData {
    struct  data{
        mapping (address => bool) members;     //maintains the list of addreess 
    }
    function addmember(data storage self,address addr) returns (bool){  //we can call this function in contracts of other files to add some address
        if(self.members[addr]){                                              
            return false;
        }
        self.members[addr]=true;
        return false;
    }
    function delmember(data storage self,address addr) returns (bool){   //we can call this function in contracts of other files to remove some address
        if(self.members[addr]){
            return false;
        }
        self.members[addr]=false;
        return true;
    }
}
