//
//  PackCardView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 21/06/22.
//

import SwiftUI

struct PackCardView: View {
    var body: some View {
        CardView {
            AsyncImage(
                url: URL(string: "https://picsum.photos/\(Int.random(in: 300..<900))"), content: { image in
                image.resizable()
                        .transition(.opacity)
            }, placeholder: {
                R.color.asyncImagePlaceholder()?.swiftUIColor
            })
            .aspectRatio(1, contentMode: .fill)
        }
    }
}

#Preview {
    PackCardView()
}
