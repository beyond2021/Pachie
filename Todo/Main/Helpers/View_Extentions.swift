//
//  View_Extentions.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/11/23.
//

import SwiftUI
// Custom View Extentions
extension View {
    /// Custom Spacers - WE ARE USING THIS INSTEWAD OF SPACERS
    @ViewBuilder
    func hSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxWidth: .infinity, alignment: alignment)
    }
    
    @ViewBuilder
    func vSpacing(_ alignment: Alignment) -> some View {
        self
            .frame(maxHeight: .infinity, alignment: alignment)
    }
    // Checking if two dates are the same
    func isSameDate(_ date1: Date, _ date2: Date) -> Bool {
        return Calendar.current.isDate(date1, inSameDayAs: date2)
        
    }
    //Disable With Opacity
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.5 : 1)
    }
}
