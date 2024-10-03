//
//  Token.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import Foundation
import SwiftUI

@Observable
class Token {
    enum Player {
        case greenPlayer, redPlayer, noPlayer
        
        var opposite: Player {
            switch self {
            case .greenPlayer: return .redPlayer
            case .redPlayer: return .greenPlayer
            default: return .noPlayer
            }
        }
        
        var color: Color {
            switch self {
            case .greenPlayer: return Color.green
            case .redPlayer: return Color.red
            case .noPlayer: return Color.gray
            }
        }
        
        var imageName: String {
            switch self {
            case .greenPlayer: return "circle.fill"
            case .redPlayer: return "circle.fill"
            case .noPlayer: return "x.circle.fill"
            }
        }
    }
    
    enum CompassDirection: CaseIterable {
        case north, south, east, west
        
        var rowOffset: Int {
            switch self {
                /// row matters for left/right (east/west)
            case .east: return 1
            case .west: return -1
            default: return 0
            }
        }
        
        var colOffsset: Int {
            switch self {
                /// col matters for up/down (north/south)
            case .north: return -1
            case .south: return 1
            default: return 0
            }
        }
    }
    
    var player: Player
    var row: Int
    var col: Int
    
    
    init(row: Int, col: Int, player: Player) {
        self.row = row
        self.col = col
        self.player = player
    }
}
