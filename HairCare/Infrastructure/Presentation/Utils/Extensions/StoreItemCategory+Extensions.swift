//
//  StoreItemCategory+Extensions.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 09/12/22.
//

import Foundation

extension StoreItemCategory {
    var localizedName: String {
        let localizedResource: LocalizedStringResource = switch self {
        case .packs:
                .Common.packs
        case .shampoo:
                .Common.shampoo
        case .hairMask:
                .Common.hairMask
        case .conditioner:
                .Common.conditioner
        case .painting:
                .Common.painting
        }
        return String(localized: localizedResource)
    }
}
