//
//  Pack.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 29/07/22.
//

import Foundation

struct Pack: StoreItem {
    
    let id: String
    let name: String
    var imageUrl: String?
    let price: Price
    let items: [Product]
    let category: StoreItemCategory
    
    init(id: String, name: String, imageUrl: String?, price: Price, items: [Product]) {
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
        self.price = price
        self.items = items
        self.category = StoreItemCategory.packs
    }
}
