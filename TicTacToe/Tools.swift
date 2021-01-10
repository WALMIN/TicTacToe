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
    
    var oSound = AVAudioPlayer()
    var xSound = AVAudioPlayer()
    
    init() {
        // Prepare background music
        do {
            backgroundMusic = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "background-music", ofType: "wav")!))
            backgroundMusic.numberOfLoops = -1
            backgroundMusic.prepareToPlay()
            
        } catch {
            print(error)
            
        }
        
        // Prepare Player 0 sound
        do {
            oSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "o-sound", ofType: "wav")!))
            oSound.prepareToPlay()
            
        } catch {
            print(error)
            
        }
        
        // Prepare Player X sound
        do {
            xSound = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "x-sound", ofType: "wav")!))
            xSound.prepareToPlay()
            
        } catch {
            print(error)
            
        }
        
    }
    
    // Opens a link in web browser
    func openLink(url: String){
        let webURL = url
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(URL(string: webURL)!, options: [:], completionHandler: nil)
                
            } else {
                UIApplication.shared.openURL(URL(string: webURL)!)
                
            }
        
    }
    
}
