//
//  CartItem.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 30/06/22.
//

import Foundation


struct CartItem<T: StoreItem> {
    let item: T
    var amount: Int
    
    var isPack: Bool {
        item is Pack
    }
}
