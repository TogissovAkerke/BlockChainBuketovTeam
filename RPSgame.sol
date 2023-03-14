//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import "@openzeppelin/contracts/utils/Strings.sol";
contract RockPaperScissors {

    uint8  option;
    
   
    string public about_game="Choose 1-Rock  2-paper 3-scissors";
    constructor() payable {}
    

    function RPS_game(uint8 _option) public payable returns (string memory){
        require(_option <4 && _option >0, "You can choose only 1, 2, 3");
      
        // 100000 gwei = 0.0001 bnb
       
        require(msg.value>0 && msg.value>=100000 gwei, "Insufficient Balance"); 
        uint256 random = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, block.number))) % (3);
        random=random+1;      
        // random - компьютердің кездейсоқ таңдауы 1-Rock  2-paper 3-scissors

        if (random == _option)
        {
            return string(abi.encodePacked(Strings.toString(random),' ', " - Draw"));
        }
        else{
            if ((_option==1 && random==3))
                {                                    
                    payable(msg.sender).transfer(msg.value*2);
                    return string(abi.encodePacked(Strings.toString(random), ' '," - You won!"));
                }
            else if ((_option==2 && random==1))
                {   
                    payable(msg.sender).transfer(msg.value*2);                                 
                    return string(abi.encodePacked(Strings.toString(random), ' '," - You won!"));
                }
            else if ((_option==3 && random==2))
                {                                    
                    payable(msg.sender).transfer(msg.value*2);
                    return string(abi.encodePacked(Strings.toString(random), ' '," - You won!"));
                }
            else
                {  
                    return string(abi.encodePacked(Strings.toString(random),' '," - You lose..." ));
                }
        }
        }

         receive() external payable { }
    }

