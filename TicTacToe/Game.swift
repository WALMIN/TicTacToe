//
//  Game.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-18.
//

import Foundation
import UIKit

class Game {
    
    let player1 = Player(id: 1, name: "Victor", wins: 0)
    let player2 = Player(id: 2, name: "Felicia", wins: 0)
    
    var currentPlayer: Player
    var gameRunning = true
    var board = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    var totalItems = 0
        
    let combinations = [
        /* Horizontal */ [0, 1, 2], [3, 4, 5], [6, 7, 8],
        /* Vertical */ [0, 3, 6], [1, 4, 7], [2, 5, 8],
        /* Diagonal */ [0, 4, 8], [2, 4, 6]
    ]

    init(){
        currentPlayer = player1
        
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
                
            } else {
                button.setBackgroundImage(UIImage(named: "cross"), for: .normal)
                currentPlayer = player1
                
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
                    print("WINNER: \(player1.name) / \(player1.wins)")
                    
                } else {
                    player2.wins += 1
                    print("WINNER: \(player2.name) / \(player2.wins)")
                    
                }
                
                gameRunning = false
                resetGame()
                
                break
                
            } else {
                // If the board is full there was a draw
                if totalItems == 9 {
                    print("DRAW")
                    
                    gameRunning = false
                    resetGame()
                    
                    break
                    
                }
                
            }
            
        }
        
    }
    
    func resetGame() {
        
 
    }
    
}
