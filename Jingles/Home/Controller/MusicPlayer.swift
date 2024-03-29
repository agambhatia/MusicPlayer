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

protocol SongIsPlayingDelegate{
    func didPlaySong(played: Bool)
}

public class MusicPlayer{
    static let shared = MusicPlayer()

    var nextSong: Song?
    var prevSong: Song?
    var recents: [Song] = []
    var currentSong: Song?
    var player: AVAudioPlayer?
    var delegate: SongIsPlayingDelegate?
    var recentsDelegate: SongIsPlayingDelegate?
    
    func play(song: Song) {
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
            includeInRecents(song: song)
            fetchNextSong()
            fetchPrevSong()
            delegate?.didPlaySong(played: player.isPlaying)
            recentsDelegate?.didPlaySong(played: player.isPlaying)
                } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func pausePlayer() {
        guard let player = player else {
            return
        }
        
        player.pause()
        delegate?.didPlaySong(played: player.isPlaying)
    }
    
    func fetchNextSong() {
        var j = 0
        while currentSong?.title != LibraryManager.shared.songs[j].title && j < LibraryManager.shared.songs.count {
            j += 1
        }
        if j == LibraryManager.shared.songs.count - 1 {
            nextSong = LibraryManager.shared.songs[0]
        } else {
            nextSong = LibraryManager.shared.songs[j+1]
        }
    }
    
    func fetchPrevSong() {
        var i = 0
         while currentSong?.title != LibraryManager.shared.songs[i].title && i < LibraryManager.shared.songs.count {
            i += 1
        }
        if i == 0 {
            prevSong = LibraryManager.shared.songs[LibraryManager.shared.songs.count-1]
        } else {
            prevSong = LibraryManager.shared.songs[i-1]
        }
    }
    func  includeInRecents(song: Song){
        for i in 0..<recents.count
        {
         if song.title == recents[i].title
         {
            recents.remove(at: i)
            break
            }
        }
        
        if recents.count == 10
        {
            recents.remove(at: 9)
        }
        recents.insert(song, at: 0)
    }
}
