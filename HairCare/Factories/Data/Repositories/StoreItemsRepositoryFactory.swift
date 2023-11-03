//
//  StoreItemsRepositoryFactory.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 05/04/23.
//

import Foundation

class StoreItemsRepositoryFactory {
    static func makeStoreItemsRepository() -> StoreItemsRepositoryProtocol {
        return StoreItemsRepository(
            packsApi: PacksApiService(),
            productsApi: ProductsApiService()
        )
    }
}
