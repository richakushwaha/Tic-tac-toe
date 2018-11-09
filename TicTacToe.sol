pragma solidity ^0.4.7;
contract TicTacToe {

    uint[3][] board;
    mapping(address => uint) participantNumber;
    mapping(uint => address) playerTrack;
    mapping(address => bool) playerTurn;
    uint participantRegistered;
    bool flag;
   
    struct Player
    {
        address playerId;
        // bool movePLayed;
        uint numberOfMovesPlayed;
    }
    
    Player[] participants;
    
    constructor() public
    {
        for(uint i=0; i<3; i++)
        {
            for(uint j=0; j<3; j++)
                board[i][j] = 0;
        }
        
        participantRegistered = 0;
        flag = true;
    }
    
    function registerPlayers()
    // onlyTwoPlayer()
    {
        participantRegistered += 1;
        participantNumber[msg.sender] = participantRegistered;
        Player newPlayer;
        newPlayer.playerId = msg.sender;
        // newPlayer.movePLayed = false;
        newPlayer.numberOfMovesPlayed = 0;
        
        participants.push(newPlayer);
        if(participantRegistered == 1)
        {
            playerTurn[msg.sender] = true;
        }
        else
        {
             playerTurn[msg.sender] = false;   
        }
    }
    
    function setMove(uint x, uint y)
    //indexInRange()
    //cannotPlayAgain()
    
    {
        uint temp = participantNumber[msg.sender];
        board[x][y] = temp;
        
        
    }
}
