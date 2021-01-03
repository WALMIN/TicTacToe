//
//  Game.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-18.
//

import Foundation
import UIKit

class Game {
    
    // Game
    var currentPlayer: Player!
    var gameRunning = true
    var board = [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    var totalItems = 0
        
    let combinations = [
        /* Horizontal */ [0, 1, 2], [3, 4, 5], [6, 7, 8],
        /* Vertical */ [0, 3, 6], [1, 4, 7], [2, 5, 8],
        /* Diagonal */ [0, 4, 8], [2, 4, 6]
    ]
    
    // Players
    var player1: Player!
    var player2: Player!
    var twoPlayer = true
    
    // Views
    var itemButtons: [UIButton]!
    
    var winnerLabel: UILabel!
    var turnLabel: UILabel!
    var xLabel: UILabel!
    var yLabel: UILabel!
    
    func initialize(_ player1: Player, _ player2: Player, _ twoPlayer: Bool, _ itemButtons: [UIButton]!, _ winnerLabel: UILabel, _ turnLabel: UILabel, _ xLabel: UILabel, _ yLabel: UILabel) {
        currentPlayer = player1
        
        self.player1 = player1
        self.player2 = player2
        self.twoPlayer = twoPlayer
        
        self.itemButtons = itemButtons
        self.winnerLabel = winnerLabel
        self.turnLabel = turnLabel
        self.xLabel = xLabel
        self.yLabel = yLabel
        
        winnerLabel.isHidden = true
        
        turnLabel.text = "\(player1.name)'s turn"
        xLabel.text = "\(player1.name): \(player1.wins)"
        yLabel.text = "\(player2.name): \(player2.wins)"
        
    }
    
    func place(button: UIButton){
        // Hide winner label if it's showing
        if !winnerLabel.isHidden {
            winnerLabel.isHidden = true
            
        }
        
        // Check if position is free & game is running
        if board[button.tag] == 0 && gameRunning {
            // Place player on the board
            board[button.tag] = currentPlayer.id
            totalItems += 1
            
            // Place item & switch player
            if currentPlayer.id == 1 {
                button.setBackgroundImage(UIImage(named: "cross"), for: .normal)
                currentPlayer = player2
                turnLabel.text = "\(player2.name)'s turn"
                
            } else {
                button.setBackgroundImage(UIImage(named: "nought"), for: .normal)
                currentPlayer = player1
                turnLabel.text = "\(player1.name)'s turn"
                
            }
            
            checkWin()
            
        }
            
    }
    
    func placeAI(button: UIButton) {
        // Hide winner label if it's showing
        if !winnerLabel.isHidden {
            winnerLabel.isHidden = true
            
        }
        
        // Check if position is free & game is running
        if board[button.tag] == 0 && gameRunning {
            // Place player item on the board
            board[button.tag] = player1.id
            totalItems += 1
            button.setBackgroundImage(UIImage(named: "cross"), for: .normal)
            
            // Switch to AI if board not full & tell AI to make a move
            if totalItems < 9 {
                makeAIMove()
            
            }
            checkWin()
                
        }
        
    }
    
    func makeAIMove(){
        let randomPosition = Int.random(in: 0...8)
        
        // Position empty, place item
        if board[randomPosition] == 0 && gameRunning {
            // Place AI item on the board
            board[randomPosition] = player2.id
            totalItems += 1
            itemButtons[randomPosition].setBackgroundImage(UIImage(named: "nought"), for: .normal)
            
            checkWin()
            
        // Position not empty, try again
        } else {
            makeAIMove()
            
        }
        
    }
    
    func checkWin() {
        // Loop through combinations
        for combination in combinations {
            if board[combination[0]] != 0 &&
                board[combination[0]] == board[combination[1]] &&
                board[combination[1]] == board[combination[2]] {
                
                // Check which player won & show that
                if board[combination[0]] == 1 {
                    player1.wins += 1
                    
                    winnerLabel.isHidden = false
                    winnerLabel.text = "\(player1.name) won"
                    xLabel.text = "\(player1.name): \(player1.wins)"
                    
                    currentPlayer = player1
                    
                } else {
                    player2.wins += 1
                    
                    winnerLabel.isHidden = false
                    winnerLabel.text = "\(player2.name) won"
                    yLabel.text = "\(player2.name): \(player2.wins)"
                    
                    currentPlayer = player2
                    
                }
                
                gameRunning = false
                resetGame()
                
                break
                
            }
            
        }
        
        // Check if there are empty spots
        for i in board {
            if i == 0 {
                gameRunning = true
                break
                
            }
            
            // If the board is full there was a draw
            if totalItems == 9 {
                turnLabel.text = "Draw"
                currentPlayer = player1
                gameRunning = false
                resetGame()
                
                break
                
            }
            
        }
        
        // Game is not running so there was a draw
        if !gameRunning {
            turnLabel.text = "Draw"
            currentPlayer = player1
            resetGame()
            
        }
        
    }
    
    func resetGame() {
        // Reset game values
        gameRunning = true
        board = [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
        totalItems = 0
 
        // Clear the board
        for i in 0...8 {
            itemButtons[i].setBackgroundImage(nil, for: .normal)
            
        }
    
        // If playing with AI & AI won then AI makes first move
        if !twoPlayer && currentPlayer.id == 2 {
            makeAIMove()
            
            // Tell player to make a move
            turnLabel.text = "\(player1.name)'s turn"
            
        } else {
            // Show next player
            turnLabel.text = "\(currentPlayer.name)'s turn"
            
        }
        
    }
    
}
