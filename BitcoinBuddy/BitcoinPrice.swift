//
//  BitcoinPrice.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 6/12/21.
//

import SwiftUI

struct BitcoinPrice: View {
    @State private var price = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
    BitcoinPriceItem(price: price)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(
            Image("BtcBackground")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .task {
            await loadBitcoinPrice()
        }
    }
    
    // Request API
    private func loadBitcoinPrice() async {
        guard let url = URL(string: "https://btcbuddy.dennistech.io/btc") else {
            print("Invalid URL")
            return
        }
        
        while true {
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                if let decodedResponse = try? JSONDecoder().decode(BitcoinResponse.self, from: data) {
                    let price = decodedResponse.message.price
                    self.price = convertToDollar(price: price)
                    print(price)
                    try! await Task.sleep(nanoseconds: 3_000_000_000)
                }
            } catch {
                print("Invalid data")
            }
        }
    }
    
    // Format currency
    private func convertToDollar(price: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        
        let number = NSNumber(value: Float(price)!)
        
        return formatter.string(from: number)!
    }
}

struct BitcoinPrice_Previews: PreviewProvider {
    static var previews: some View {
        BitcoinPrice()
    }
}
