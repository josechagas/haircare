//
//  ProductDetailReadModeView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 24/06/22.
//

import SwiftUI

struct ProductDetailReadMoreView: View {
    var body: some View {
        ScrollView {
            HStack {
                VStack(alignment: .leading, spacing: 10){
                    Text(R.string.productDetail.description())
                        .font(.title)
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
                    )
                }
                Spacer()
            }
            .padding()
        }
    }
}

struct ProductDetailReadModeView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailReadMoreView()
    }
}
