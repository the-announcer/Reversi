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
    
    let frameLength: CGFloat = 38
    
    var body: some View {
        Button(action: tapAction) {
            ZStack {
                VStack {
                    Image(systemName: player.imageName)
                        .resizable()
                        .foregroundStyle(player.color)
                        .frame(width: frameLength, height: frameLength)
                        .scaledToFit()
                }
                
                /// show x:y coordinates on the token if enabled
                if debugOptions.showCoordinates {
                    HStack(alignment: .center, spacing: 0) {
                        Text("\(token.row)")
                        Text(":")
                        Text("\(token.col)")
                    }
                    .foregroundStyle(.primary)
                    .bold()
                }
            }
        }
        .buttonStyle(.plain)
        .frame(width: frameLength, height: frameLength)
    }
}

#Preview {
//    TokenView()
}
