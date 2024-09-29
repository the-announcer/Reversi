//
//  Token.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import Foundation

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
    }
    
    var row: Int
    var col: Int
    var player: Player
    
    init(row: Int, col: Int, player: Player) {
        self.row = row
        self.col = col
        self.player = player
    }
}
