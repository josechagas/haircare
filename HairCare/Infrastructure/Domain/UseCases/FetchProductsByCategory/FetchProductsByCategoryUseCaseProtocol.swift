
//
//  FetchProductsByCategoryUseCaseProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 03/12/25.
//


protocol FetchProductsByCategoryUseCaseProtocol: UseCase {
    func execute() async throws -> [StoreItemCategory : [Product]]
}
