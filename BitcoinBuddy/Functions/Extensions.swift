//
//  Extensions.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 28/12/21.
//

import SwiftUI

// MARK: - CONDITIONAL WRAPPER
extension View {
    @ViewBuilder
    func `if`<Content: View>(_ conditional: Bool, content: (Self) -> Content) -> some View {
        if conditional {
            content(self)
        } else {
            self
        }
    }
}
