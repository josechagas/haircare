//
//  ProductDetailBuilder.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/12/24.
//

@MainActor
struct ProductDetailBuilder {
    private let product: Product
    
    func build() -> View {
        let viewModel = ProductDetailViewModel(product: product)
        return ProductDetailPage(viewModel: viewModel)
    }
}
