//
//  Game.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-18.
//

import Foundation
import UIKit

class Game {

    var currentPlayer = 1
    var board = [ 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ]
    
    func place(button: UIButton){
        // Check empty place
        if board[button.tag] == 0 {
            // Add player to board place
            board[button.tag] = currentPlayer
            
            // Place item & switch player
            if currentPlayer == 1 {
                button.setBackgroundImage(UIImage(named: "nought"), for: .normal)
                currentPlayer = 2
                
            } else {
                button.setBackgroundImage(UIImage(named: "cross"), for: .normal)
                currentPlayer = 1
                
            }
            
        }
            
    }
    
    func checkWin() {
        
        
    }
    
}
