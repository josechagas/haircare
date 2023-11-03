//
//  ProductDetailViewModelFactory.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/12/22.
//

import Foundation

@MainActor
class ProductDetailViewModelFactory {
    class func makeProductDetailViewModel(product: Product) -> ProductDetailViewModel {
        return ProductDetailViewModel(product: product)
    }
}
