//
//  StoreItem.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 29/07/22.
//

import Foundation

protocol StoreItem: Identifiable, Codable {
    var id: String {get}
    var name: String {get}
    var imageUrl: String? {get}
    var price: Price {get}
    var category: StoreItemCategory {get}
}

enum StoreItemCategory: String, CaseIterable, Codable, Indexed {
    case shampoo
    case hairMask
    case conditioner
    case painting
    case packs
    
    var index: Int {
        Self.allCases.firstIndex(of: self) ?? 0
    }
}

protocol Indexed {
    var index: Int {get}
}
