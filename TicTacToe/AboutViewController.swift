//
//  AboutViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2021-01-04.
//

import UIKit

class AboutViewController: UIViewController {

    let tools = Tools()
    
    var links = [
        "https://www.github.com/WALMIN/TicTacToe",
        "https://www.walmin.com"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func linkButton(_ sender: UIButton) {
        tools.openLink(url: links[sender.tag])
        
    }
    
}
