//
//  HomeUseCase.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 19/08/22.
//

import Foundation

actor HomeUseCase: HomeUseCaseProtocol {
    
    private let repository: HomeRepositoryProtocol
    
    init(repository: HomeRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadPacks() async throws -> [Pack] {
        return try await repository.loadPacks()
    }
    
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]] {
        return try await repository.loadProductsByCategory()
    }
}
