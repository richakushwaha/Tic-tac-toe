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
    modifier onlyTwoPlayer()
    {
        require(participantRegistered <= 2, "There can only be two players");
        _;
    }
    
    modifier indexInRange(uint x1, uint y1)
    {
        require(x1>=0 && x1<=2 && y1>=0 && y1<=2, "Range for board location should be between 0 and 2");
        _;
    }
    modifier cannotPlayAgain()
    {
        require(flag == playerTurn[msg.sender], "You already played your move");
        _;
    }
    
    function registerPlayers()
    onlyTwoPlayer()
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
    indexInRange(x, y)
    cannotPlayAgain()
    // noWinner()
    {
        uint temp = participantNumber[msg.sender];
        board[x][y] = temp;
        
        flag = !flag;
        
        if(evaluateDiagonal(temp))
        {
            
        }
        
    }
    
    function evaluateDiagonal(uint number) returns(bool)
    {
        if(number = board[0][0] && board[0][0]==board[1][1] && board[2][2]==board[1][1])
        {
            return true;
        }
        if(number = board[0][2] && board[0][2]==board[1][1] && board[2][0]==board[1][1])
        {
            return true;
        }
        return false;
    }
}
