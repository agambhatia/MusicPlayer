//
//  MusicPlayer.swift
//  Jingles
//
//  Created by Mini31 on 21/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
public class MusicPlayer {
    
        static let shared = MusicPlayer()
    static var player: AVAudioPlayer?
    
    public static  func playSound(withAudioPath: URL ) {
        
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            
            
            
            player = try AVAudioPlayer(contentsOf: withAudioPath, fileTypeHint: AVFileType.mp3.rawValue)
            
            
            
            
            
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
  
}
