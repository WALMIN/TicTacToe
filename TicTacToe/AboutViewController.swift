//
//  AboutViewController.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2021-01-04.
//

import UIKit

class AboutViewController: UIViewController {

    let tools = Tools()
    
    var licenses = [
        "https://opengameart.org/content/8-bit-battle-theme-famitracker",
        "https://github.com/google/material-design-icons",
        "https://soundcloud.com/cleytonkauffman"
    ]
    
    var links = [
        "https://www.github.com/WALMIN/TicTacToe",
        "https://www.walmin.com"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background image for about
        tools.setBackgroundImage(view: self.view, image: "background-game")
        
    }
    
    @IBAction func licenseButton(_ sender: UIButton) {
        tools.openLink(url: licenses[sender.tag])
        
    }
    
    @IBAction func linkButton(_ sender: UIButton) {
        tools.openLink(url: links[sender.tag])
        
    }
    
}
