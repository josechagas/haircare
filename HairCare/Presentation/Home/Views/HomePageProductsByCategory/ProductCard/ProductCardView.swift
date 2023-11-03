//
//  ProductCardView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 17/06/22.
//

import SwiftUI

struct ProductCardView: View {
    
    @EnvironmentObject private var cartService: CartService
    let product: Product
    
    var body: some View {
        CardView {
            VStack(alignment: .center){
                Image(R.image.sampleProduct.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                InfoView(
                    category: "Category", name: product.name
                )
                Spacer()
                FooterView(
                    price: product.price,
                    plusButtonAction: {
                        cartService.addProduct(CartItem(item: product, amount: 1))
                    }
                )
            }
            .padding(20)
        }
        .aspectRatio(contentMode: .fit)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(
            product: Product(id: "00",
                             name: "Product",
                             imageUrl: nil,
                             category: .conditioner,
                             price: Price(valueInCents: 10000, currency: "$"))
        )
            .preferredColorScheme(.light)
            .padding(20)
    }
}
