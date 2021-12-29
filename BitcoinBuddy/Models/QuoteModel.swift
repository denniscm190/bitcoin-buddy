//
//  QuoteModel.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 28/12/21.
//

import Foundation

struct QuoteResponse: Codable {
    var message: QuoteResult
}

struct QuoteResult: Codable {
    var latestPrice: String
    var changePercent: Float
    var change: Float
    var latestUpdate: Int
}
