//
//  Genre.swift
//  Jingles
//
//  Created by Mini31 on 13/06/18.
//  Copyright © 2018 Copper Mobile. All rights reserved.
//

import UIKit


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
