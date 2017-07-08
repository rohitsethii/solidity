pragma solidity ^0.4.0;

import 'library.sol';           //importing the library.sol file
 
 contract Uselibrary{
     LibraryData.data admins;
     
     event success();             // Events allow you to react onchanges efficiently    
     
     modifier onlyadmins(){              
        require(admins.members[msg.sender]);     //only admin can add or remove addresses    
         _;
     }
     function Uselibrary(){                 // This is the constructor whose code is run only when the contract is created
         LibraryData.addmember(admins,msg.sender);      
     }
     function add(address addr) onlyadmins(){             //adding an address using addmember function from library
         if(LibraryData.addmember(admins,addr)){         
         }
         success();
     }
      function remove(address addr) onlyadmins(){        //removing an address using addmember function from library
         if(LibraryData.delmember(admins,addr)){
         }
         success();
     }
 }
