//
//  BookModel.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 28/12/21.
//

import Foundation

struct BookResponse: Codable {
    var message: BookNestedResponse
}

struct BookNestedResponse: Codable {
    var bids: [BookResult]
    var asks: [BookResult]
}

struct BookResult: Codable, Hashable {
    var price: String
    var size: String
    var timestamp: Int
}
