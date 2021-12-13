//
//  BitcoinView.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 6/12/21.
//

import SwiftUI

struct BitcoinView: View {
    @State private var price = BitcoinPriceMessage(price: "")
    @State private var quote = BitcoinQuoteMessage(
        askPrice: "", askSize: "", bidPrice: "", bidSize: "", change: 0, changePercent: 0, high: "", latestVolume: "", low: ""
    )
    
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()

    var body: some View {
        NavigationView {
            
            Form {
                BitcoinPriceItem(price: convertToDollar(number: price.price))
                    .padding(.vertical)
                
                Section(header: Text("Stats")) {
                    StatItem(name: "Ask price", value: convertToDollar(number: quote.askPrice))
                    StatItem(name: "Bid price", value: convertToDecimal(number: quote.bidPrice))
                    StatItem(name: "Ask size", value: convertToDecimal(number: quote.askSize))
                    StatItem(name: "Bid size", value: convertToDecimal(number: quote.bidSize))
                    StatItem(name: "Change", value: convertToDecimal(number: String(quote.change)))
                    StatItem(name: "Percent change", value: convertToPercent(number: String(quote.changePercent)))
                    StatItem(name: "High", value: convertToDollar(number: quote.high))
                    StatItem(name: "Low", value: convertToDollar(number: quote.low))
                    StatItem(name: "Latest volume", value: convertToDecimal(number: quote.latestVolume))
                }
            }
            .navigationTitle("Hey!")
        }
        .onAppear(perform: requestApi)
        .onReceive(timer) { _ in
            requestApi()
        }
    }
    
    private func requestApi() {
        httpRequest(url: "https://api.bitcoinbuddy.app/price/btc", model: BitcoinPriceResponse.self) { result in
            price = result.message
            print("Price endpoint requested")
        }
        
        httpRequest(url: "https://api.bitcoinbuddy.app/quote/btc", model: BitcoinQuoteResponse.self) { result in
            quote = result.message
            print("Quote endpoint requested")
        }
    }
    
    // Format currency
    private func convertToDollar(number: String) -> String {
        guard let number = Float(number) else {
            return String()
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        let result = NSNumber(value: number)
        
        return formatter.string(from: result)!
    }

    // Format percent number
    private func convertToPercent(number: String) -> String {
        guard let number = Float(number) else {
            return String()
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        let result = NSNumber(value: number)
        
        return formatter.string(from: result)!
    }

    // Format decimal number
    private func convertToDecimal(number: String) -> String {
        guard let number = Float(number) else {
            return String()
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let result = NSNumber(value: number)
        
        return formatter.string(from: result)!
    }
}

struct BitcoinPrice_Previews: PreviewProvider {
    static var previews: some View {
        BitcoinView()
    }
}
