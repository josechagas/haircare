//
//  ProductDetailViewModel.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 22/08/22.
//

import Foundation

class ProductDetailViewModel: ProductDetailViewModelProtocol {
    let product: Product
    
    init(product: Product) {
        self.product = product
    }
}
