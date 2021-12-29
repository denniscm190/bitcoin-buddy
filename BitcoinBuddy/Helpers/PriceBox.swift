//
//  PriceBox.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 29/12/21.
//

import SwiftUI

struct PriceBox: View {
    var quote: QuoteResult
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(height: 160)
            .foregroundColor(Color(.secondarySystemBackground))
            .overlay(
                HStack(spacing: 20) {
                    Image("BitcoinLogo")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        let floatPrice = convertToFloat(string: quote.latestPrice)
                        let formattedPrice = formatToCurrency(amount: floatPrice, with: "USD")
                        Text(formattedPrice)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack {
                            let formattedChange = formatToCurrency(amount: quote.change, with: "USD")
                            Text(formattedChange)
                            
                            let formattedChangePct = formatToPercent(amount: quote.changePercent)
                            Text(formattedChangePct)
                        }
                        .font(.headline)
                        .foregroundColor(colorReturn())
                        
//                        let stringDate = convertToDate(epoch: quote.latestUpdate / 1000)
//                        Text(stringDate)
//                            .font(.caption)
//                            .opacity(0.4)
                    }
                }
                    .padding()
                , alignment: .leading
            )
    }
    
    // Transform srting to float
    private func convertToFloat(string: String) -> Float {
        guard let floatAmount = Float(string) else {
            return 0
        }
        
        return floatAmount
    }
    
    // Get color given percent change sign
    private func colorReturn() -> Color {
        if quote.changePercent >= 0 {
            return .green
        } else {
            return .red
        }
    }
}

struct PriceBox_Previews: PreviewProvider {
    static var previews: some View {
        PriceBox(
            quote:
                QuoteResult(
                    latestPrice: "43456.30",
                    changePercent: 0.1234,
                    change: 2342.29,
                    latestUpdate: 1566249085120
                )
        )
    }
}
