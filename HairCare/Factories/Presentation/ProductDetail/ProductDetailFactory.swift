//
//  ProductDetailFactory.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/12/22.
//

import Foundation

@MainActor
class ProductDetailFactory {
    class func makeProductDetail(product: Product) -> ProductDetailPage<ProductDetailViewModel> {
        let viewModel = ProductDetailViewModelFactory.makeProductDetailViewModel(product: product)
        return ProductDetailPage(viewModel: viewModel)
    }
}
