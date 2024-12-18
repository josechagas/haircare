//
//  IngredientCardView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 24/06/22.
//

import SwiftUI

struct IngredientCardView: View {
    
    let name: String
    let imageUrl: String?
    
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            AsyncImage(
                url: URL(string: imageUrl ?? ""), content: { image in
                image.resizable()
                        .transition(.opacity)
            }, placeholder: {
                R.color.asyncImagePlaceholder()?.swiftUIColor
            })
            .cornerRadius(20)
            .aspectRatio(1, contentMode: .fit)
            Text(name)
                .font(.caption2)
                .lineLimit(1)
        }
    }
}

struct IngredientCardView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientCardView(
            name: "Ingredient",
            imageUrl: "https://picsum.photos/\(Int.random(in: 300..<900))"
        )
            .frame(width: 120)
    }
}
