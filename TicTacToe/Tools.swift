//
//  Tools.swift
//  TicTacToe
//
//  Created by Victor Bergene on 2021-01-04.
//

import Foundation
import UIKit
import AVFoundation

struct Tools {
    
    var backgroundMusic = AVAudioPlayer()
    
    init() {
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "background-music", ofType: "wav")!))
            backgroundMusic.numberOfLoops = -1
            backgroundMusic.prepareToPlay()
            
        } catch {
            print(error)
            
        }
        
    }
    
    func openLink(url: String){
        let webURL = url
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string: webURL)!, options: [:], completionHandler: nil)
                
            } else {
                UIApplication.shared.openURL(URL(string: webURL)!)
                
            }
        
    }
    
}
