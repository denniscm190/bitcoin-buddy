//
//  BitcoinQuoteModel.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 12/12/21.
//

import Foundation

struct BitcoinQuoteResponse: Codable {
    let message: BitcoinQuoteMessage
    let statusCode: Int
}

struct BitcoinQuoteMessage: Codable {
    var askPrice: String
    let askSize: String
    var bidPrice: String
    let bidSize: String
    let change: Double
    let changePercent: Double
    var high: String
    let latestVolume: String
    var low: String
}
