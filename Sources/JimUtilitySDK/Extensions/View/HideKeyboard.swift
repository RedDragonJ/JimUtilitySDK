//
//  HideKeyboard.swift
//
//
//  Created by James Layton on 7/11/24.
//

import SwiftUI

public extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}
