//
//  Song.swift
//  Jingles
//
//  Created by Mini31 on 13/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
import AVFoundation

struct Song {
    var title: String
    var genre: String
    var album: String
    var artist: String
    var albumArt: String
    
    var description: String {
        return "Song named \(title), sung by \(artist)"
    }
    
    var albumAbsolute: Album? {
        if album.isEmpty {
            return nil
        }
        return Album(title: album, image: albumArt, songs: [self])
    }
    
    var genreAbsolute: Genre {
        return Genre(stringRawValue: genre)
    }
    
    init?(from playerItem: AVPlayerItem) {
        let metadataList = playerItem.asset.metadata
        
        
        var title: String = String()
        var genre: String = String()
        var albumArt: String = String()
        var artistName: String = String()
        var albumName: String = String()
        
        for item in metadataList {
            guard let key = item.commonKey,
                let value = item.value else {
                    continue
            }
            print("\(key.rawValue)")
            
            
            switch key.rawValue {
            case Source.AVItemKeys.albumName:
                guard let albumTitle = value as? String, !albumTitle.isEmpty else {
                    return nil
                }
                albumName = albumTitle
                
            case Source.AVItemKeys.artist :
                guard let artist = value as? String, !artist.isEmpty else{
                    artistName = "unknown"
                    break
                }
                artistName = artist
                
            case Source.AVItemKeys.title:
                guard let songTitle = value as? String, !songTitle.isEmpty else {
                    return nil
                }
                title=songTitle
                
            case Source.AVItemKeys.artwork:
                guard let artwork = value as? String, !artwork.isEmpty else {
                    albumArt = "unknown"
                    break
                }
                albumArt = artwork
                
            case Source.AVItemKeys.type:
                guard let type = value as? String else {
                    break
                }
                genre = type
                
            default: print("\(value)")
                continue
            }
        }
        self.genre=genre
        self.title = title
        self.album=albumName
        self.artist=artistName
        self.albumArt=albumArt
    }
}
