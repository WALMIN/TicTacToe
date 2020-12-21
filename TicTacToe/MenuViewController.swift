//
//  MenuViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-21.
//

import UIKit

class MenuViewController: UIViewController {

    let seguePlayWithFriend = "PlayWithFriend"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func playButton(_ sender: UIButton) {
        performSegue(withIdentifier: seguePlayWithFriend, sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == seguePlayWithFriend {
            _ = segue.destination as! ViewController
                        
        }
    
    }
    
}
