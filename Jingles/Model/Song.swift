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
    var fileURL: URL
    var title: String
    var genre: String
    var album: String
    var artist: String
    var albumArt: UIImage?

    var description: String {
        return "Song named \(title), sung by \(artist)"
    }
    
    var albumAbsolute: Album? {
        if album.isEmpty {
            return nil
        }
        return Album(title: album, songs: [self], image: albumArt)
    }
    
    var genreAbsolute: Genre {
        return Genre(stringRawValue: genre)
    }
    var artistAbsolute: Artist? {
        if artist.isEmpty {
            return nil
        }
        return Artist(name: artist, songs: [self])
    }
    
    init?(from playerItem: AVPlayerItem, url: URL) {
        let metadataList = playerItem.asset.metadata
        var title: String = String()
        var genre: String = String()
        var albumArt: UIImage? = nil
        var artistName: String = String()
        var albumName: String = String()
      
        for item in metadataList {
            guard let key = item.commonKey,
                let value = item.value else {
                    continue
            }
           
            
            
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
                guard let artworkData = value as? Data,
                    let image = UIImage(data: artworkData) else {
                    albumArt = nil
                    break
                }
                
                albumArt = image
                
            case Source.AVItemKeys.type:
                guard let type = value as? String else {
                    break
                }
                genre = type
                
            default: print("\(value)")
                continue
            }
        }
        
        self.fileURL = url
        self.genre = genre
        self.title = title
        self.album = albumName
        self.artist = artistName
        self.albumArt = albumArt
    }
}
