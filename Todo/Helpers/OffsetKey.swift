//
//  OffsetKey.swift
//  Todo
//
//  Created by KEEVIN MITCHELL on 7/18/23.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
    
}
