//
//  PacksApiService.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/08/22.
//

import Foundation

struct PacksApiService: PacksApiServiceProtocol {
    func loadPacks() async throws -> [Pack] {
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
        let allCategories = StoreItemCategory.allCases
        var response: [Pack] = []
            
        for index in 0..<(allCategories.count) {
            let category = allCategories[index]
            
            let packs: [Pack] = (0..<Int.random(in: 3...10)).map { subIndex in
                
                let items = (0..<Int.random(in: 3...6)).map { packSubIndex in
                    Product(
                        id: UUID().uuidString,
                        name: "Hair Strength \(packSubIndex + subIndex + index)",
                        imageUrl: nil,
                        category: category,
                        price: Price(
                            valueInCents: Int.random(in: 6000...35990),
                            currency: "$"
                        )
                    )
                }
                
                return Pack(
                    id: UUID().uuidString,
                    name: "Pack Hair Max \(subIndex + index)",
                    imageUrl: nil,
                    price: Price(
                        valueInCents: Int.random(in: 6000...35990),
                        currency: "$"
                    ),
                    items: items
                )
            }
            
            response.append(contentsOf: packs)
        }
        return response
    }
}
