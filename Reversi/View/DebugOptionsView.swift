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
            HStack {
                Toggle(isOn: $debugOptions.showCoordinates) {
                    Text("Show Coordinates: ")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal)
                .padding(.bottom)
            }
            
            if let myToken = board.tappedToken {
                VStack(alignment: .leading) {
                    Text("Tapped Row: \(myToken.row)")
                    Text("Tapped Col: \(myToken.col)")
                }
                .containerRelativeFrame([.horizontal]) { length, _ in
                    return length / 3
                }
                .border(.blue)
            }
//            else {
//                VStack {
//                    Text("Tapped Row:")
//                    Text("Tapped Col:")
//                }
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding()
//            }
        }
//        .border(.red)
    }
}

#Preview {
    DebugOptionsView()
}
