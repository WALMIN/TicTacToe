//
//  ViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2020-12-17.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var itemButtons: [UIButton]!
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    
    let game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        game.initializeViews(itemButtons, turnLabel, xLabel, yLabel)
        
    }

    @IBAction func placeItem(_ sender: UIButton) {
        game.place(button: sender)
        
    }
    
}
