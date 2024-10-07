//
//  CompassDirection.swift
//  Reversi
// 
//  Created by the_announcer on 10/6/24
// 

import Foundation

enum CompassDirection: CaseIterable {
    case north, south, east, west

    var rowOffset: Int {
        switch self {
            /// col matters for up/down (north/south)
        case .north: return -1
        case .south: return 1
        default: return 0
        }
    }
        
    var colOffset: Int {
        switch self {
            /// row matters for left/right (east/west)
        case .east: return 1
        case .west: return -1
        default: return 0
        }
    }
}
