//
//  StoreItemCategory+Extensions.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 09/12/22.
//

import Foundation

extension StoreItemCategory {
    var localizedName: String {
        switch self {
        case .packs:
            return R.string.storeItemCategory.packs()
        case .shampoo:
            return R.string.storeItemCategory.shampoo()
        case .hairMask:
            return R.string.storeItemCategory.hair_mask()
        case .conditioner:
            return R.string.storeItemCategory.conditioner()
        case .painting:
            return R.string.storeItemCategory.painting()
        }
    }
}
