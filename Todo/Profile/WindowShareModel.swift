//
//  WindowShareModel.swift
//  Pachie
//
//  Created by KEEVIN MITCHELL on 9/5/23.
//

import SwiftUI
@Observable
class WindowShareModel {
    var sourceRect: CGRect = .zero
    var previousSourceRect: CGRect = .zero
    var hideNativeView: Bool = false
    var selectedProfile: Profile?
    // Resetting Properties
    func reset() {
        sourceRect = .zero
        previousSourceRect = .zero
        hideNativeView = false
        selectedProfile = nil
        
    }
}
