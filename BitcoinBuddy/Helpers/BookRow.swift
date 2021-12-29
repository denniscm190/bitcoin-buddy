//
//  BookRow.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 29/12/21.
//

import SwiftUI

struct BookRow: View {
    var book: BookResult
    var color: Color
    
    var body: some View {
        VStack {
            let price = formatToCurrency(amount: Float(book.price)!, with: "USD")
            Text(price)
                .fontWeight(.semibold)
                .foregroundColor(color)
                .opacity(0.7)
                .lineLimit(1)
            
            Divider()
        }
    }
}

struct BookRow_Previews: PreviewProvider {
    static var previews: some View {
        BookRow(
            book:
                BookResult(
                    price: "43256.40",
                    size: "0.256",
                    timestamp: 1566249085120
                ),
            color: .green
        )
    }
}
