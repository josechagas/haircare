//
//  ViewStoreItemsUseCaseFactory.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 19/08/22.
//

import Foundation

class ViewStoreItemsUseCaseFactory {
    static func makeViewStoreItemsUseCase() -> ViewStoreItemsUseCaseProtocol {
        let repository = StoreItemsRepositoryFactory.makeStoreItemsRepository()
        return ViewStoreItemsUseCase(
            repository: repository
        )
    }
}
