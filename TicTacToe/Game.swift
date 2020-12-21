//
//  Game.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-18.
//

import Foundation
import UIKit

class Game {
    
    // Views
    var itemButtons: [UIButton]!
    
    var turnLabel: UILabel!
    var xLabel: UILabel!
    var yLabel: UILabel!
    
    // Players
    let player1 = Player(id: 1, name: "Victor", wins: 0)
    let player2 = Player(id: 2, name: "Felicia", wins: 0)
    
    // Game
    var currentPlayer: Player!
    var gameRunning = true
    var board = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    var totalItems = 0
        
    let combinations = [
        /* Horizontal */ [0, 1, 2], [3, 4, 5], [6, 7, 8],
        /* Vertical */ [0, 3, 6], [1, 4, 7], [2, 5, 8],
        /* Diagonal */ [0, 4, 8], [2, 4, 6]
    ]
    
    func initialize(_ itemButtons: [UIButton]!, _ turnLabel: UILabel, _ xLabel: UILabel, _ yLabel: UILabel) {
        currentPlayer = player1
        
        self.itemButtons = itemButtons
        self.turnLabel = turnLabel
        self.xLabel = xLabel
        self.yLabel = yLabel
        
        turnLabel.text = "\(player1.name)'s turn"
        xLabel.text = "X | \(player1.name): \(player1.wins)"
        yLabel.text = "Y | \(player2.name): \(player2.wins)"
        
    }
    
    func place(button: UIButton){
        // Check if position is free & game is running
        if board[button.tag] == 0 && gameRunning {
            // Add player to board & add 1 total item to the board
            board[button.tag] = currentPlayer.id
            totalItems += 1
            
            // Place item & switch player
            if currentPlayer.id == 1 {
                button.setBackgroundImage(UIImage(named: "nought"), for: .normal)
                currentPlayer = player2
                turnLabel.text = "\(player2.name)'s turn"
                
            } else {
                button.setBackgroundImage(UIImage(named: "cross"), for: .normal)
                currentPlayer = player1
                turnLabel.text = "\(player1.name)'s turn"
                
            }
            
            checkWin()
            
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
                    
                    turnLabel.text = "\(player1.name) won"
                    xLabel.text = "X | \(player1.name): \(player1.wins)"
                    
                } else {
                    player2.wins += 1
                    
                    turnLabel.text = "\(player2.name) won"
                    yLabel.text = "O | \(player2.name): \(player2.wins)"
                    
                }
                
                gameRunning = false
                resetGame()
                
                break
                
            } else {
                // If the board is full there was a draw
                if totalItems == 9 {
                    turnLabel.text = "Draw"
                    
                    gameRunning = false
                    resetGame()
                    
                    break
                    
                }
                
            }
            
        }
        
    }
    
    func resetGame() {
        // Reset game values
        currentPlayer = player1
        gameRunning = true
        board = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
        totalItems = 0
 
        // Clear the board
        for i in 0...8 {
            itemButtons[i].setBackgroundImage(nil, for: .normal)
            
        }
        
    }
    
}
