//
//  DebugOptionsView.swift
//  Reversi
// 
//  Created by the_announcer on 9/29/24
// 

import SwiftUI

struct DebugOptionsView: View {
    
    @Environment(DebugOptions.self) private var debugOptions
    
    var body: some View {
        @Bindable var debugOptions = debugOptions
        
        HStack {
            Toggle(isOn: $debugOptions.showCoordinates) {
                Text("Show Coordinates: ")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding()
        }
    }
}

#Preview {
    DebugOptionsView()
}
