//
//  DebugOptions.swift
//  Reversi
// 
//  Created by the_announcer on 9/29/24
// 

import Foundation

@Observable
class DebugOptions {
    
    var showCoordinates: Bool
    
    init(showCoordinates: Bool) {
        self.showCoordinates = showCoordinates
    }
    
}
