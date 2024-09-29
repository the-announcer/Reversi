//
//  ContentView.swift
//  Reversi
//
//  Created by the_announcer on 9/28/24
// 

import SwiftUI

struct ContentView: View {
    @State private var showCoordinates: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Toggle(isOn: $showCoordinates,
                       label: {
                            Text("Show Coordinates: ")
                })
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding()
            }
            GameBoardView()
            
        }
        
    }
}

#Preview {
    ContentView()
}
