pragma solidity ^0.4.7;
contract TicTacToe {

    uint[3][] board;
    mapping(address => uint) participantNumber;
    uint participantRegistered;
   
    struct Player
    {
        address playerId;
        bool movePLayed;
        uint numberOfMovesPlayed;
    }
    
    Player[] participants;
    
    constructor() public
    {
        for(uint i=0; i<3; i++)
        {
            for(uint j=0; j<3; j++)
                board[i].push(0);
        }
        
        participantRegistered = 0;
    }
    
    function registerPlayers()
    // onlyTwoPlayer()
    {
        participantRegistered += 1;
        participantNumber[msg.sender] = participantRegistered;
    }
    
    function setMove(uint x, uint y)
    
    {
        
    }
}