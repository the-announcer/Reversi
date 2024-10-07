//
//  DebugOptionsView.swift
//  Reversi
// 
//  Created by the_announcer on 9/29/24
// 

import SwiftUI

struct DebugOptionsView: View {
    
    @Environment(DebugOptions.self) private var debugOptions
    private var board = GameBoard.shared
    
    var body: some View {
        @Bindable var debugOptions = debugOptions
        
        VStack(alignment: .leading) {
            Toggle(isOn: $debugOptions.showCoordinates) {
                Text("Show Coordinates: ")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.horizontal)

            VStack(alignment: .leading) {
                if let myToken = board.tappedToken {
                    VStack(alignment: .leading) {
                        Text("Tapped Row: \(myToken.row)")
                        Text("Tapped Col: \(myToken.col)")
                    }
                }
                else {
                    VStack(alignment: .leading) {
                        Text("Tapped Row: _")
                        Text("Tapped Col: _")
                    }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("nextRow: \(board.evaluating?.row)")
                        Text("nextCol: \(board.evaluating?.col)")
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
//        .border(.red)
    }
}

#Preview {
    DebugOptionsView()
}
