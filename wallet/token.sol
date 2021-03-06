pragma solidity ^0.4.8;
contract MyToken {
    /* Public variables of the token */
    string public standard = 'Token 0.1';
    string public name="Rose";
    string public symbol="ROS";
    uint8 public decimals=18;
    uint256 public totalSupply;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* This notifies clients about the amount burnt */
    event Burn(address indexed from, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MyToken(
        /*uint256 initialSupply,
        string tokenName,
        uint8 decimalUnits,
        string tokenSymbol
        */) {
            uint256 initialSupply=10000000 * 1 wei;
        //string tokenName;
       // uint8 decimalUnits;
       // string tokenSymbol;
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        totalSupply = initialSupply;                        // Update total supply
       // name = tokenName;                                   // Set the name for display purposes
        //symbol = tokenSymbol;                               // Set the symbol for display purposes
        //decimals = decimalUnits;                            // Amount of decimals for display purposes
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (_to == 0x0) throw;                               // Prevent transfer to 0x0 address. Use burn() instead
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }
}