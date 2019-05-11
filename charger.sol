pragma solidity 0.4.24;

contract charger{
    
    bool schalter;
    address owner;
    uint dauer;
    string s = "Strom ist an";
    string s1 = "Analge ist momentan nicht verfügbar";
    uint256 scale = 10**18*1 ether;
    
    mapping(address => uint) balances;
    
    constructor() public payable{
        schalter = false;
        owner = msg.sender;
        dauer = 0 ;
    }
    
    function getSchalterStatus() view public returns(bool){
        return schalter;
    }
    
    function setSchalterAus() public{
        if(msg.sender == owner || msg.sender == 0xf0198100cB8BbBA815aF45803Ce45562e8bF19AF){
            schalter = false;
        }
    }
    function ausleihen(uint256 a) public payable returns(string){
        uint256 e = a*1 ether;
        require((balances[msg.sender] + msg.value) >= balances[msg.sender]);
        require(!schalter);
        if(!schalter){
            if(e != (msg.value)){
                revert();
            }
        schalter = true;
        dauer = a;
        return s;
        }
        else{
        revert();
        }
    }
    function getGesamtDauer() view public returns(uint){
        return dauer;
    }
     function getContractBalanceInWei() view public returns(uint){
        require(msg.sender==owner);
        return address(this).balance;
    }
    
    function transfer(address to, uint256 amount) public {
        require(msg.sender==owner);
        to.transfer(amount*1 ether);
    }
    
}
