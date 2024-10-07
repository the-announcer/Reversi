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
    
    let size = 8
    
    let rowCount: Int
    let colCount: Int
    
    var grid = [[Token]]()
    var currentPlayer: Token.Player = .greenPlayer
    
    var redScore: Int = 0
    var greenScore: Int = 0
    
    var tappedToken: Token?
    var evaluating: Token?
    
    private init() {
        rowCount = self.size
        colCount = self.size
        
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
        if let tappedToken {
            guard checkOutOfBounds(for: tappedToken, direction: .east)
            else { return }
            evaluating = inspect(from: tappedToken)
        }
    }
    
    func flipToken(token: Token) {
        token.player = token.player.opposite
    }
    
    func inspect(from token: Token) -> Token? {
        /// start from the tapped token
        /// queue the captured tokens to flip
        var pendingCapturedTokens: [Token] = []
        
        var next: Token? {
            if let token = tappedToken {
                grid[token.row][token.col + 1]
            } else {
                nil
            }
        }
        
        return next
    }
    
    func checkOutOfBounds(for token: Token, direction: CompassDirection) -> Bool {
        
        /// check row and column to ensure our next item is not out of array bounds
        /// the CompassDirection enum provides the row,col incremental values relative to the
        /// position of the passed in token.row and token.col
        
        /// check row bounds
        guard (token.row + direction.rowOffset < self.size) &&
                (token.row + direction.rowOffset > Int.zero)
        else {
            return false
        }
        
        /// check column bounds
        guard (token.col + direction.colOffset < self.size) &&
                (token.col + direction.colOffset > Int.zero)
        else {
            return false
        }
    
        return true
    }
    
}

