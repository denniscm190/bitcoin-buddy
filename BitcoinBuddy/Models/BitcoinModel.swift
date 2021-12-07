//
//  BitcoinResponseModel.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 7/12/21.
//

import SwiftUI

struct BitcoinResponse: Codable {
    let message: BitcoinMessage
    let statusCode: Int
}

struct BitcoinMessage: Codable {
    let price: String
}
