//
//  GameBoard.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import Foundation

@Observable
class GameBoard {
    static let shared = GameBoard()
    
    let rowCount = 8
    let colCount = 8
    
    var grid = [[Token]]()
    var currentPlayer: Token.Player = .greenPlayer
    
    var redScore: Int = 0
    var greenScore: Int = 0
    
    var tappedToken: Token?
    
    private init() {
        reset()
    }
    
    func reset() {
        /// clear everything
        grid.removeAll()
        
        /// initialize gameboard
        for row in 0..<rowCount {
            /// create new row of Token objects
            var newRow = [Token]()
            /// go across and add a new Token in each slot
            for col in 0..<colCount {
                let token = Token(row: row, col: col, player: .greenPlayer)
                /// add each column to the current row
                newRow.append(token)
            }
            /// add the current row to the grid
            grid.append(newRow)
        }
    }
    
    func tapAction(token: Token) {
        flipToken(token: token)
        tappedToken = token
    }
    
    func flipToken(token: Token) {
        token.player = token.player.opposite
    }
}
