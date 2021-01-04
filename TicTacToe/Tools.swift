//
//  Tools.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2021-01-04.
//

import Foundation
import UIKit

struct Tools {
    
    func openLink(url: String){
        let webURL = url
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string: webURL)!, options: [:], completionHandler: nil)
                
            } else {
                UIApplication.shared.openURL(URL(string: webURL)!)
                
            }
        
    }
    
}
