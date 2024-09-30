//
//  GameTokenView.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import SwiftUI

struct TokenView: View {
    
    @Environment(DebugOptions.self) var debugOptions
    @Bindable var token: Token
    
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
        Button(action: tapAction) {
            var color: Color {
                switch player {
                case .greenPlayer: return Color.green
                case .redPlayer: return Color.red
                case .noPlayer: return Color.gray
                }
            }
            
            ZStack {
                VStack {
                    Image(systemName: image)
                        .resizable()
                        .foregroundStyle(color)
                        .frame(width: frameSize, height: frameSize)
                        .scaledToFit()
                }
                
                /// show x:y coordinates on the token if enabled
                if debugOptions.showCoordinates {
                    HStack(alignment: .center, spacing: 0) {
                        Text("\(token.row)")
                        Text(":")
                        Text("\(token.col)")
                    }
                    .foregroundStyle(.white)
                    .bold()
                }
            }
        }
        .buttonStyle(.plain)
        .frame(width: frameSize, height: frameSize)
    }
}

#Preview {
//    TokenView()
}
