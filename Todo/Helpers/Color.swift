//
//  Color.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/11/23.
//

import SwiftUI
extension Color {
    static var taskColor1: Color {
        Color("TaskColor 1")
    }
    static var taskColor2: Color {
        Color("TaskColor 2")
    }
    static var taskColor3: Color {
        Color("TaskColor 3")
    }
    static var taskColor4: Color {
        Color("TaskColor 4")
    }
    static var taskColor5: Color {
        Color("TaskColor 5")
    }
    static var BG: Color {
        Color("BG")
    }
    static var appYellow: Color {
        Color("AppYellow")
    }
    
}
extension ShapeStyle where Self == Color {
    static var BG: Color {
        Color("BG")
    }
    static var darkBlue: Color {
        Color("DarkBlue")
    }
    
}
extension String {
    static var pic: String {
        "Pic"
    }
   
}

