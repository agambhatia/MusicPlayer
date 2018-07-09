//
//  LibraryManager.swift
//  Jingles
//
//  Created by Mini31 on 12/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation
class LibraryManager {
    
    static let shared = LibraryManager()
    
    var songs : [Song] = []
    var genre: [Genre] = []
    var album : [Album] = []
    var artist: [Artist] = []
    
    func initialise() {
        
        var albumsDictionary: [String : Album] = [ : ]
        var artistDictionary: [String : Artist] = [ : ]
        let audioInfo = MPNowPlayingInfoCenter.default()
        print(audioInfo)
        for i in 0...Source.URLs.songs.count-1{
            guard let audioPath: URL = (Bundle.main.url(forResource: Source.URLs.songs[i], withExtension: "mp3")) else {
                return
            }
            
            let playerItem = AVPlayerItem(url: audioPath)
            if let song = Song(from: playerItem, url: audioPath) {
                LibraryManager.shared.songs.append(song)
                if let _ = albumsDictionary[song.album] {
                    albumsDictionary[song.album]?.include(song: song)
                    
                } else {
                    albumsDictionary[song.album] = song.albumAbsolute
                }
                if let _ = artistDictionary[song.artist] {
                    artistDictionary[song.artist]?.include(song: song)
                } else {
                    artistDictionary[song.artist] = song.artistAbsolute
                }
                
            }
        }
        
        LibraryManager.shared.album = Array(albumsDictionary.values)
        LibraryManager.shared.artist = Array(artistDictionary.values)
    }
    
    
    private init() {}
    

}





/*
 var albums: [Album]
 for aSong in songs {
 
 }
 */











