//
//  FetchPacksUseCase.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 03/12/25.
//


actor FetchPacksUseCase: FetchPacksUseCaseProtocol {
    private let repository: ItemsRepositoryProtocol
    
    init(repository: ItemsRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async throws -> [Pack] {
        return try await repository.loadPacks()
    }
}
