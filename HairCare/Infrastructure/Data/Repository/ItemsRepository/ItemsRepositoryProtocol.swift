//
//  ItemsRepositoryProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 03/12/25.
//


protocol ItemsRepositoryProtocol: Repository {
    func loadPacks() async throws -> [Pack]
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]]
}
