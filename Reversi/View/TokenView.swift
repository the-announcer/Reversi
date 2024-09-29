//
//  GameTokenView.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import SwiftUI

struct TokenView: View {
    var token: Token
    var player: Token.Player
    var tapAction: () -> Void
    
    let frameSize: CGFloat = 38
    
    var image: String {
        switch player {
        case .greenPlayer: return "circle.fill"
        case .redPlayer: return "circle.fill"
        case .noPlayer: return "x.circle.fill"
        }
    }
    
    var body: some View {
        ZStack {
            Button(action: tapAction) {
                var color: Color {
                    switch player {
                    case .greenPlayer: return Color.green
                    case .redPlayer: return Color.red
                    case .noPlayer: return Color.gray
                    }
                }
                
                Image(systemName: image)
                    .resizable()
                    .foregroundStyle(color)
                    .frame(width: frameSize, height: frameSize)
                    .scaledToFit()
//                    .border(.blue)
                
            }
            .buttonStyle(.plain)
            .frame(width: frameSize, height: frameSize)
        }
        
    }
}

#Preview {
//    TokenView()
}
