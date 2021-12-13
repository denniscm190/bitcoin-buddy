//
//  BitcoinPriceModel.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 7/12/21.
//

import Foundation

struct BitcoinPriceResponse: Codable {
    let message: BitcoinPriceMessage
    let statusCode: Int
}

struct BitcoinPriceMessage: Codable {
    var price: String
}
