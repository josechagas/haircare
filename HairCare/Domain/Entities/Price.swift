//
//  Price.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 29/07/22.
//

import Foundation

struct Price: Codable {
    let valueInCents: Int
    let currency: String
}

extension Price {
    func formattedPrice() -> String?  {
        let formatter = NumberFormatter()
        formatter.currencySymbol = currency
        formatter.numberStyle = .currency
        
        let value = Double(valueInCents)/100.0
        
        return formatter.string(from: NSNumber(value: value)) ?? currency+"????"
    }
}
