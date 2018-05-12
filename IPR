pragma solidity ^0.4.0;
contract IPR {
    
    struct License {
        string owner;
        address account;
        string parent;     
        uint time;   
    }
    
    address account;
    string fileName;
    string author;    
    string descrpition;
    string private keys;
    bytes32[] private buyers;        
    uint creatTime;    
    uint price;
    
    mapping(address=>License) licenses;

    modifier isNotAuthor() {
        require(msg.sender != account); 
        _;
    }
 
    event GetLicense(string owner, address account, string parent, uint time);
    event GetRecord(string fileName, address account, string author, string buyers, string keys, string descrpition, uint price, uint time);
    event GetKeys(string seller, string buyer , string keys, uint price);
    event GetDetail(string fileName, string author, string descrpition, uint price, uint time);

    function IPR(string _fileName, string _author,string _keys,uint _price,string _descrpition) public {
        account = msg.sender;
        author = _author;
        fileName = _fileName;
        keys = _keys;
        price = _price;
        descrpition = _descrpition;
        creatTime = now;
        GetRecord(fileName, account, author, bytes32ArrayToString(buyers), keys, descrpition, price, creatTime);
    }
    
    function addIPR(string _owner) isNotAuthor() internal returns(bool) {
        License storage ipr = licenses[msg.sender];
        ipr.account = msg.sender;
        ipr.owner = _owner;
        ipr.parent = author;
        ipr.time = now;
        buyers.push(stringToBytes32(_owner));
        GetLicense(ipr.owner, ipr.account, ipr.parent, ipr.time);  
        return true;
    }

    function buyIPR(string _owner) isNotAuthor() public payable returns(string _keys) {
        if (((msg.value / 1 ether) < price) || (msg.sender == account)) {
            revert();
        } else {
            account.transfer(price * (1 ether));
            addIPR(_owner);
            GetKeys(author, _owner, keys, price);
            return keys;
        }
    }

    function getdetail() public returns(string _fileName, string _theAuthor, string _itsDescrpition, uint _thePrice , uint _theCreatTime) {
        GetDetail(fileName,author,descrpition,price,creatTime);
        return (fileName,author,descrpition,price,creatTime);
    }

    function getIPR() public returns(bool) {
        if (msg.sender == account) {
            return getRecord();
        }else {
            return getLicense();
        }
    }

    function getRecord() internal returns(bool) {
        GetRecord(fileName, account, author, bytes32ArrayToString(buyers), keys, descrpition, price, creatTime);
        if (buyers.length == 0) {            
            return false;
        } else {
            return true;
        }
    }

    function getLicense() internal returns(bool) {
        License storage ipr = licenses[msg.sender];
        if (ipr.account == address(0)) {
            return false;
        }else {
            GetLicense(ipr.owner, ipr.account, ipr.parent, ipr.time);
            return true;
        }
    }
  
    function stringToBytes32(string memory source) internal pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }
    
        assembly {
            result := mload(add(source, 32))
        }
    }

    function bytes32ArrayToString(bytes32[] data) internal pure returns (string) {
        bytes memory bytesString = new bytes(data.length * 32 + data.length);
        uint urlLength;
        for (uint i = 0; i < data.length; i++) {
            uint8 flag;
            if (i == data.length - 1) {
                flag = 3;
            } else {
                flag = 1;
            }
            for (uint j = 0; j < 32; j++) {
                byte char = byte(bytes32(uint(data[i]) * 2 ** (8 * j)));
                if (char != 0) {
                    bytesString[urlLength] = char;
                    urlLength += 1;
                    if (flag == 1) {
                        flag = 2;
                    }
                } else if (char == 0 && flag == 2) {
                    bytesString[urlLength] = 0x2c;
                    urlLength += 1;
                    flag = 3;
                }
            }
        }
        bytes memory bytesStringTrimmed = new bytes(urlLength);
        for (i = 0; i < urlLength; i++) {
            bytesStringTrimmed[i] = bytesString[i];
        }
        return string(bytesStringTrimmed);
    }    
}
