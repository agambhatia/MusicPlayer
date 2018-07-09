//
//  Track.swift
//  Jingles
//
//  Created by Mini31 on 28/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit

class Track {

    let name: String
    let artist: String
    let previewURL: URL
    let index: Int
   
    
    init(name: String, artist: String, previewURL: URL, index: Int) {
        self.name = name
        self.artist = artist
        self.previewURL = previewURL
        self.index = index
    }
    

}
