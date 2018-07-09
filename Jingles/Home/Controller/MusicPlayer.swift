//
//  MusicPlayer.swift
//  Jingles
//
//  Created by Mini31 on 21/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation


public class MusicPlayer {
    
    static let shared = MusicPlayer()
    
    var currentSong: Song?
    var nextSong: Song?
    var prevSong: Song?
    var player: AVAudioPlayer?

    func play(song: Song ) {
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: song.fileURL, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = player else {
                print("Player couldn't be initialised")
                return
            }
            
            currentSong = song
            player.play()
            fetchNextSong()
            fetchPrevSong()

        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func fetchNextSong()
    {
        var j = 0
        while currentSong?.title != LibraryManager.shared.songs[j].title && j < LibraryManager.shared.songs.count
        {
            j += 1
        }
        if j == LibraryManager.shared.songs.count-1
        {
            nextSong = LibraryManager.shared.songs[0]
        }
        else
        {
            nextSong = LibraryManager.shared.songs[j+1]
        }
    }
    func fetchPrevSong()
    {
        var i = 0
         while currentSong?.title != LibraryManager.shared.songs[i].title && i < LibraryManager.shared.songs.count
         {
            i += 1
        }
        if i == 0
        {
            prevSong = LibraryManager.shared.songs[LibraryManager.shared.songs.count-1]
        }
        else
        {
            prevSong = LibraryManager.shared.songs[i-1]
        }
        
    }
    
}
