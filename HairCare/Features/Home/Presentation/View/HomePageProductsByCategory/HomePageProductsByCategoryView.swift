//
//  HomePageProductsByCategoryView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 17/06/22.
//

import SwiftUI

struct HomePageProductsByCategoryView: View {
    @Environment(\.navigationDelegate) private var delegate: (any NavigationDelegate<AppRoute>)?
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
                            //TODO: Try to make possible usage of NavigationLink
//                            NavigationLink(value: AppRoute.productDetail(product: product)) {
//                                ProductCardView(
//                                    product: product
//                                )
//                            }
//                            .buttonStyle(PlainButtonStyle())
                            NavigationDelegateLink(destination: .profile(route: .edit)) {
                                ProductCardView(
                                    product: product
                                )
                            }
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
