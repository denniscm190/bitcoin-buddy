//
//  BitcoinView.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 29/12/21.
//

import SwiftUI

struct BitcoinView: View {
    
    // API request
    @State private var quote = QuoteResult(latestPrice: "", changePercent: 0, change: 0, latestUpdate: 0)
    @State private var book = BookNestedResponse(bids: [BookResult](), asks: [BookResult]())
    @State private var quoteTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    @State private var bookTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                PriceBox(quote: quote)
                
                HStack {
                    VStack(alignment: .center) {
                        Text("Asks")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
                        ForEach(book.asks.reversed(), id: \.self) { ask in
                            BookRow(book: ask, color: .green)
                        }
                    }
                    
                    Spacer()
                    VStack(alignment: .center) {
                        Text("Bids")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.bottom)
                        
                        ForEach(book.bids.reversed(), id: \.self) { bid in
                            BookRow(book: bid, color: .red)
                        }
                    }
                }
                .padding(.top)
            }
            .padding(.horizontal)
        }
        .padding(.top)
        .onAppear {
            getQuote()
            getBook()
            quoteTimer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
            bookTimer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
        }
        .onReceive(quoteTimer) { _ in
            getQuote()
        }
        .onReceive(bookTimer) { _ in
            getBook()
        }
        .onDisappear {
            quoteTimer.upstream.connect().cancel()
            bookTimer.upstream.connect().cancel()
        }
        .navigationTitle("Bitcoin price")
        .if(UIDevice.current.userInterfaceIdiom == .phone) { content in
            NavigationView { content }
        }
    }
    
    // Request Bitcoin quote
    private func getQuote() {
        let url = "https://api.bitcoinbuddy.app/crypto/btcusdt/quote"
        httpRequest(url: url, model: QuoteResponse.self) { response in
            quote = response.message
        }
    }
    
    // Request Bitcoin book
    private func getBook() {
        let url = "https://api.bitcoinbuddy.app/crypto/btcusdt/book"
        httpRequest(url: url, model: BookResponse.self) { response in
            book.asks.append(contentsOf: response.message.asks)
            book.bids.append(contentsOf: response.message.bids)
        }
    }
}

struct BitcoinView_Previews: PreviewProvider {
    static var previews: some View {
        BitcoinView()
    }
}
