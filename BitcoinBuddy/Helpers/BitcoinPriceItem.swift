//
//  BitcoinPriceItem.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 7/12/21.
//

import SwiftUI

struct BitcoinPriceItem: View {
    var price: String
    
    var body: some View {
        Text("1 BTC is worth \(price)")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color("AccentColor"))
            )
    }
}

struct BitcoinPriceItem_Previews: PreviewProvider {
    static var previews: some View {
        BitcoinPriceItem(price: "$50,328.24")
    }
}
