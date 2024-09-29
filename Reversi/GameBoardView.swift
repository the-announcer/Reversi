//
//  GameBoardView.swift
//  Reversi
// 
//  Created by the_announcer on 9/28/24
// 

import SwiftUI

struct GameBoardView: View {
    @StateObject private var board = GameBoard()
    
    let spacing: CGFloat = 12
    let frameSize: CGFloat = 32
    
    var body: some View {
        VStack(spacing: spacing) {
            ForEach(0..<8, id: \.self) { row in
                HStack(spacing: spacing) {
                    ForEach(0..<8, id: \.self) { col in
                        let token = board.grid[row][col]
                        TokenView(token: token, player: token.player) {
                            board.swap(token: token)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    GameBoardView()
}
