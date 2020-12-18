//
//  ViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-17.
//

import UIKit

class ViewController: UIViewController {

    let game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func placeItem(_ sender: UIButton) {
        game.place(button: sender)
        
    }
    
}
