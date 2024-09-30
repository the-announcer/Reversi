//
//  ContentView.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import SwiftUI

struct ContentView: View {
    
    @State var debugOptions: DebugOptions = DebugOptions(showCoordinates: false)
    
    var body: some View {
        VStack {
            DebugOptionsView()
            GameBoardView()
        }
        .environment(debugOptions)
    }
}

#Preview {
    ContentView(debugOptions: DebugOptions(showCoordinates: false))
}
