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
    
    var player: Player
    var row: Int
    var col: Int
    
    
    init(row: Int, col: Int, player: Player) {
        self.row = row
        self.col = col
        self.player = player
    }
}
