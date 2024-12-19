//
//  ProductDetailFooterView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 24/06/22.
//

import SwiftUI

struct ProductDetailFooterView: View {
    
    let price: Price
    @Binding var numberOfChoosedItems: Int
    let onAddToCartButtonClick: () -> Void
    
    var body: some View {
        VStack(spacing: 25){
            HStack {
                PriceText(
                    currency: price.currency,
                    valueInCents: price.valueInCents*numberOfChoosedItems,
                    style: .large
                )
                Spacer()
                UnitStepperView(
                    units: $numberOfChoosedItems
                )
            }
            LargeButton(
                action: onAddToCartButtonClick,
                label: {
                Text(R.string.productDetail.add_to_cart())
            })
                .buttonStyle(.borderedProminent)
                .cornerRadius(.infinity)
        }
    }
}

#Preview {
    ProductDetailFooterView(
        price: Price(valueInCents: 9840, currency: "$"),
        numberOfChoosedItems: .constant(1),
        onAddToCartButtonClick: {}
    )
}
