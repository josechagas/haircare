//
//  FooterView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/06/22.
//

import SwiftUI

struct FooterView: View {
    var price: Price
    var plusButtonAction: () -> Void
    var body: some View {
        HStack {
            PriceText(
                currency: price.currency,
                valueInCents: price.valueInCents
            )
            Spacer()
            Button(action: plusButtonAction, label: {
                Image(systemName: "plus")
                    .resizable()
                    .padding(5)
                    .frame(width: 25, height: 25)
            })
                .buttonStyle(.circularBorderedPromiment)
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(
            price: Price(valueInCents: 12000, currency: "$"),
            plusButtonAction: {}
        )
    }
}
