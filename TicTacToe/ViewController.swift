//
//  ViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-17.
//

import UIKit

class ViewController: UIViewController {

    let unwindToMenu = "unwindToMenu"
    
    @IBOutlet var itemButtons: [UIButton]!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    
    let game = Game()
    
    var twoPlayer = true
    var player1Name: String!
    var player2Name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the game
        game.initialize(Player(id: 1, name: player1Name, wins: 0),
                        Player(id: 2, name: player2Name, wins: 0),
                        itemButtons, turnLabel, xLabel, yLabel)
        
    }

    // User place item on the board
    @IBAction func placeItem(_ sender: UIButton) {
        game.place(button: sender)
        
    }
    
    @IBAction func exitBtn(_ sender: UIButton) {
        // Ask user if they want to exit
        let alert = UIAlertController(title: "Exit", message: "Are you sure you want to exit the game?", preferredStyle: .alert)
        
        // Exit to menu
        alert.addAction(
            UIAlertAction(title: "Yes", style: .default) { action in
                self.performSegue(withIdentifier: self.unwindToMenu, sender: self)
            }
        )
        
        // Close alert
        alert.addAction(UIAlertAction(title: "No", style: .cancel))
        
        // Show alert
        present(alert, animated: true)
        
    }
    
}
