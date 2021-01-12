//
//  MenuViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-21.
//

import UIKit

class MenuViewController: UIViewController {

    let tools = Tools()
    
    let seguePlayWithFriend = "playWithFriend"
    let seguePlayWithAI = "playWithAI"
    
    var playerNamesAlert: UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        // Set background image for menu
        tools.setBackgroundImage(view: self.view, image: "background-menu")
        
    }

    // Start a game
    @IBAction func playButton(_ sender: UIButton) {
        playerNamesAlert = UIAlertController(title: "Enter names", message: "", preferredStyle: .alert)
        
        // Add name fields
        playerNamesAlert.addTextField { textField in
            textField.placeholder = "Player X"
            textField.autocapitalizationType = .words
        }
        
        // Show field if two players button clicked
        if sender.tag == 0 {
            playerNamesAlert.addTextField { textField in
                textField.placeholder = "Player O"
                textField.autocapitalizationType = .words
            }
            
        }
        
        // Start game
        playerNamesAlert.addAction(
            UIAlertAction(title: "Play", style: .default) { action in
                if sender.tag == 0 {
                    self.performSegue(withIdentifier: self.seguePlayWithFriend, sender: self)
                    
                } else {
                    self.performSegue(withIdentifier: self.seguePlayWithAI, sender: self)
                    
                }
                
            }
            
        )
        
        // Close alert
        playerNamesAlert.addAction(UIAlertAction(title: "Close", style: .cancel))
        
        // Show alert
        present(playerNamesAlert, animated: true)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Play with friend
        if segue.identifier == seguePlayWithFriend {
            let friendVC = segue.destination as! ViewController
            
            // Get player names from alert & if empty set default names
            if let player1Name = playerNamesAlert.textFields![0].text {
                if player1Name.trimmingCharacters(in: .whitespaces).isEmpty {
                    friendVC.player1Name = "Player X"
                    
                } else {
                    friendVC.player1Name = player1Name
                    
                }
                
            }
            
            if let player2Name = playerNamesAlert.textFields![1].text {
                if player2Name.trimmingCharacters(in: .whitespaces).isEmpty {
                    friendVC.player2Name = "Player 0"
                    
                } else {
                    friendVC.player2Name = player2Name
                    
                }
                
            }
            
            friendVC.twoPlayer = true
                        
        }
        
        // Play with AI
        if segue.identifier == seguePlayWithAI {
            let aiVC = segue.destination as! ViewController
            
            // Get player name from alert & if empty set default names
            if let player1Name = playerNamesAlert.textFields![0].text {
                if player1Name.trimmingCharacters(in: .whitespaces).isEmpty {
                    aiVC.player1Name = "Player X"
                    
                } else {
                    aiVC.player1Name = player1Name
                    
                }
                
            }
            
            aiVC.player2Name = "AI"
            aiVC.twoPlayer = false
            
        }
    
    }
    
    @IBAction func unwindToMenu(_ unwindSegue: UIStoryboardSegue) {}
    
}
