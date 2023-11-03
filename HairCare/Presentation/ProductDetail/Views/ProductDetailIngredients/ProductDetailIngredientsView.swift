//
//  ProductDetailIngredientsView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 23/06/22.
//

import SwiftUI

struct ProductDetailIngredientsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(R.string.productDetail.ingredients()+":")
                .font(.caption)
            List(0..<40, id: \.self) { item in
                IngredientCardView(
                    name: "Ingredient \(item)",
                    imageUrl: "https://picsum.photos/\(Int.random(in: 300..<900))"
                )
                    .listRowInsets(
                        EdgeInsets(
                            top: 5,
                            leading: 0,
                            bottom: 5,
                            trailing: 0
                        )
                    )
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .frame(width: 65)
        }
    }
}

struct ProductDetailIngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailIngredientsView()
    }
}
