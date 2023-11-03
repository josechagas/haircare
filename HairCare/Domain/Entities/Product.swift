//
//  Product.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/06/22.
//

import Foundation

struct Product: StoreItem {
    let id: String
    let name: String
    let imageUrl: String?
    let category: StoreItemCategory
    let price: Price
}
