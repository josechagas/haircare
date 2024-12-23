//
//  HomePageProductsByCategoryView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 17/06/22.
//

import SwiftUI

struct HomePageProductsByCategoryView: View {
    let category: StoreItemCategory
    let products: [Product]?
    
    var body: some View {
        if let products = products {
            VStack(alignment: .leading, spacing: 20){
                Text(category.localizedName)
                    .textCase(.uppercase)
                    .padding([.leading, .trailing])
                ScrollView(.horizontal, showsIndicators: false, content: {
                    LazyHStack(spacing: 35){
                        ForEach(products) { product in
                            NavigationLink(value: AppRoute.productDetail(product: product)) {
                                ProductCardView(
                                    product: product
                                )
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .frame(height: 350)
                    .padding()
                })
            }
        }
        else {
            EmptyView()
        }
    }
}

#Preview {
    HomePageProductsByCategoryView(
        category: .shampoo,
        products: (0...10).map({ index in
            return Product(
                id: "\(index)",
                name: "product \(index)",
                imageUrl: nil,
                category: StoreItemCategory.allCases.randomElement() ?? .conditioner,
                price: Price(
                    valueInCents: 10000,
                    currency: "$"
                )
            )
        })
    )
}
