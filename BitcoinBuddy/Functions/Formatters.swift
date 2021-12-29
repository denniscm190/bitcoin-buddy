//
//  Formatters.swift
//  BitcoinBuddy
//
//  Created by Dennis Concepción Martín on 29/12/21.
//

import Foundation

// MARK: - Get number formatted as currency
func formatToCurrency(amount: Float, with currencyCode: String) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencyCode = currencyCode
    formatter.locale = Locale(identifier: "en_US")
    
    return formatter.string(from: NSNumber(value: amount)) ?? "\(amount) \(currencyCode)"
}

// MARK: - Get number formatted as percent
func formatToPercent(amount: Float) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .percent
    formatter.maximumFractionDigits = 2
    
    return formatter.string(from: NSNumber(value: amount))!
}

// MARK: - Convert epoch unix time to string date
func convertToDate(epoch: Int) -> String {
    let date = Date(timeIntervalSince1970: Double(epoch))
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
    dateFormatter.dateStyle = DateFormatter.Style.short //Set date style
    dateFormatter.timeZone = .current
    let localDate = dateFormatter.string(from: date)
    
    return localDate
}
