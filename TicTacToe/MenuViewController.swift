//
//  MenuViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-21.
//

import UIKit

class MenuViewController: UIViewController {

    let seguePlayWithFriend = "playWithFriend"
    
    var playerNamesAlert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // Start a game
    @IBAction func playButton(_ sender: UIButton) {
        playerNamesAlert = UIAlertController(title: "Enter names", message: "", preferredStyle: .alert)
        
        // Add name fields
        playerNamesAlert.addTextField { textField in
            textField.placeholder = "Player X"
            textField.autocapitalizationType = .words
        }
        
        playerNamesAlert.addTextField { textField in
            textField.placeholder = "Player O"
            textField.autocapitalizationType = .words
        }
        
        // Start game
        playerNamesAlert.addAction(
            UIAlertAction(title: "Play", style: .default) { action in
                self.performSegue(withIdentifier: self.seguePlayWithFriend, sender: self)
                
            }
        )
        
        // Close alert
        playerNamesAlert.addAction(UIAlertAction(title: "Close", style: .cancel))
        
        // Show alert
        present(playerNamesAlert, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pass player names to game
        if segue.identifier == seguePlayWithFriend {
            let gameVC = segue.destination as! ViewController
            
            // Get player names from alert & if empty set default names
            if let player1Name = playerNamesAlert.textFields![0].text {
                if player1Name.trimmingCharacters(in: .whitespaces).isEmpty {
                    gameVC.player1Name = "Player X"
                    
                } else {
                    gameVC.player1Name = player1Name
                    
                }
                
            }
            
            if let player2Name = playerNamesAlert.textFields![1].text {
                if player2Name.trimmingCharacters(in: .whitespaces).isEmpty {
                    gameVC.player2Name = "Player 0"
                    
                } else {
                    gameVC.player2Name = player2Name
                    
                }
                
            }
                        
        }
    
    }
    
    @IBAction func unwindToMenu(_ unwindSegue: UIStoryboardSegue) {}
    
}
