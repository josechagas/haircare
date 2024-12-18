//
//  ProductDetailViewModelProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 22/08/22.
//

import Foundation


protocol ProductDetailViewModelProtocol: ViewModel {
    var product: Product {get}
}

extension ProductDetailViewModelProtocol {
    var name: String {
        return product.name
    }
    
    var category: StoreItemCategory {
        return product.category
    }
    
    var price: Price {
        return product.price
    }
}
