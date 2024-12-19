//
//  ProductDetailBuilder.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/12/24.
//

import SwiftUI

@MainActor
struct ProductDetailBuilder {
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    func build() -> some View {
        let viewModel = ProductDetailViewModel(product: product)
        return ProductDetailPage(viewModel: viewModel)
    }
}
