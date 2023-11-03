//
//  ShowStoreItemsUseCase.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 19/08/22.
//

import Foundation

actor ViewStoreItemsUseCase: ViewStoreItemsUseCaseProtocol {
    
    private let repository: StoreItemsRepositoryProtocol
    
    init(repository: StoreItemsRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadPacks() async throws -> [Pack] {
        return try await repository.loadPacks()
    }
    
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]] {
        return try await repository.loadProductsByCategory()
    }
}
