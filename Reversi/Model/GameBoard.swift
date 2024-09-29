//
//  GameBoard.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import Foundation

class GameBoard: ObservableObject {
    let rowCount = 8
    let colCount = 8
    
    @Published var grid = [[Token]]()
    @Published var currentPlayer: Token.Player = .greenPlayer
    
    @Published var redScore: Int = 0
    @Published var greenScore: Int = 0
    
    init() {
        reset()
    }
    
    func reset() {
        /// clear everything
        grid.removeAll()
        
        for row in 0..<rowCount {
            var newRow = [Token]()
            
            for col in 0..<colCount {
                let token = Token(row: row, col: col, player: .greenPlayer)
                /// add each column to the current row
                newRow.append(token)
            }
            /// add the current row to the grid
            grid.append(newRow)
        }
    }
    
    func swap(token: Token) {
        objectWillChange.send()
        token.player = token.player.opposite
    }
}
