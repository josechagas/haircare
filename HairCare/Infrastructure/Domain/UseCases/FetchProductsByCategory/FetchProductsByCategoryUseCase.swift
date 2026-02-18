//
//  FetchProductsByCategoryUseCase.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 03/12/25.
//


actor FetchProductsByCategoryUseCase: FetchProductsByCategoryUseCaseProtocol {
    private let repository: ItemsRepositoryProtocol
    
    init(repository: ItemsRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [StoreItemCategory : [Product]] {
        return try await repository.loadProductsByCategory()
    }
}
