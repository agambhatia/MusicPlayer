//
//  LibraryManager.swift
//  Jingles
//
//  Created by Mini31 on 12/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit
import AVFoundation

enum Genre: Int {
    case rock
    case pop
    case metal
    case rAndB
    case alternative
    case unknown
    
    init(rawValue: Int) {
        switch rawValue {
        case 0: self = .rock
        case 1: self = .pop
        case 2: self = .metal
        case 3: self = .rAndB
        case 4: self = .alternative
        default: self = .unknown
        }
    }
    
    init(stringRawValue: String) {
        switch stringRawValue {
        case Genre.rock.title.lowercased(): self = .rock
        case Genre.pop.title.lowercased(): self = .pop
        case Genre.metal.title.lowercased(): self = .metal
        case Genre.rAndB.title.lowercased(): self = .rAndB
        case Genre.alternative.title.lowercased(): self = .alternative
        default: self = .unknown
        }
    }
    
    var title: String {
        switch self {
        case .rock: return "Rock"
        case .pop: return "Pop"
        case .alternative: return "Alternative Rock"
        case .metal: return "Metal"
        case .rAndB: return "R&B"
        case .unknown: return "Unknown"
        }
    }
}

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


struct Album {
    var title: String
    var image: String
    var songs: [Song]
 

    
    var imageURL: URL? {
        return URL(string: image)
    }
}

struct Artist {
    var name: String
    var albums: [Album]
    
}

class LibraryManager {
    
    var atists: [Artist] = []
    var songs : [Song] = []
    var album : [Album] = []
    var genre: [Genre] = []
    
}



struct Source {
    struct URLs {
        static let songs = ["01_01", "01_02", "01_03", "01_04", "01_05", "01_06", "01_07", "01_08", "01_09", "01_10", "01_11", "01_12", "01_13", "01_14", "02_01", "02_02", "02_03", "02_04", "02_05", "02_06", "02_07", "02_08"]
        }
    
    struct AVItemKeys {
        static let type = "type"
        static let title = "title"
        static let artist = "artist"
        static let artwork = "artwork"
        static let albumName = "albumName"
    }
}


