//
//  Player.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-18.
//

import Foundation

class Player {

    let id: Int
    let name: String
    var wins: Int
    
    init(id: Int, name: String, wins: Int) {
        self.id = id
        self.name = name
        self.wins = wins
        
    }
    
}
