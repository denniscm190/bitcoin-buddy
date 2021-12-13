//
//  StatItem.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 12/12/21.
//

import SwiftUI

struct StatItem: View {
    var name: String
    var value: String
    
    var body: some View {
        HStack {
            Text(name)
            Spacer()
            Text(value)
        }
    }
}

struct StatItem_Previews: PreviewProvider {
    static var previews: some View {
        StatItem(name: "Ask price", value: "40,389.33")
    }
}
