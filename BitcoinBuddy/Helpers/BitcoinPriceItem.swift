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
        HStack {
            Image("BitcoinLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 90, height: 90)
                .padding(.trailing)
            
            VStack {
                Text(price)
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    Text(Date.now, format: .dateTime.day().month().year())
                    Text(Date.now, format: .dateTime.hour().minute())
                }
                .font(.callout)
                .opacity(0.6)
                
            }
        }
    }
}

struct BitcoinPriceItem_Previews: PreviewProvider {
    static var previews: some View {
        BitcoinPriceItem(price: "$50,328.24")
    }
}
