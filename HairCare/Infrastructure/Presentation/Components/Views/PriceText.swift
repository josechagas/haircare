//
//  PriceText.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 24/06/22.
//

import SwiftUI

struct PriceText: View {
    
    private var style: PriceText.Style = .medium
    let valueInCents: Int
    let currency: String
    
    init(currency: String, valueInCents: Int, style: PriceText.Style = .medium) {
        self.currency = currency
        self.valueInCents = valueInCents
        self.style = style
    }
    
    var body: some View {
        Text(styledPrice())
    }
    
    private func styledPrice()-> AttributedString {
        let formattedPrice = formattedPrice()
        let onlyFormattedValue = formattedPrice.replacingOccurrences(of: currency, with: "")
        
        var attributtedStringValue = AttributedString(stringLiteral: onlyFormattedValue)
        var attributtedStringCurrency = AttributedString(stringLiteral: currency)

        var currencyAttributes = AttributeContainer()
        currencyAttributes.font = currencyFont()
        attributtedStringCurrency.setAttributes(currencyAttributes)

        var valueAttributes = AttributeContainer()
        valueAttributes.font = valueFont()
        attributtedStringValue.setAttributes(valueAttributes)

        var attributedPrice = AttributedString(stringLiteral: "")
        attributedPrice.append(attributtedStringCurrency)
        attributedPrice.append(attributtedStringValue)
        
        return attributedPrice
    }
    
    private func formattedPrice()-> String {
        let formatter = NumberFormatter()
        formatter.currencySymbol = currency
        formatter.numberStyle = .currency
        let value = Double(valueInCents)/100.0
        let formattedValue = formatter.string(from: NSNumber(value: value)) ?? currency+"????"
        return formattedValue
    }
    
    private func valueFont()->Font {
        switch(style) {
        case .small:
            return .footnote
        case .medium:
            return .body
        case .large:
            return .title
        }
    }
    
    private func currencyFont()->Font {
        switch(style) {
        case .small:
            return .footnote
        case .medium, .large:
            return .body
        }
    }
}

struct PriceText_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            PriceText(
                currency: "$", valueInCents: 19099, style: .small
            )
            PriceText(
                currency: "$", valueInCents: 19099
            )
            PriceText(
                currency: "$", valueInCents: 19099, style: .large
            )
        }
    }
}


extension PriceText {
    enum Style {
        case small, medium, large
    }
}
