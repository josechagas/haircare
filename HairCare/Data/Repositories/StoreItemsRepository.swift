//
//  StoreItemsRepository.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/08/22.
//

import Foundation

struct StoreItemsRepository: StoreItemsRepositoryProtocol {
    private let packsApi: PacksApiServiceProtocol
    private let productsApi: ProductsApiServiceProtocol
    
    init(
        packsApi: PacksApiServiceProtocol,
        productsApi: ProductsApiServiceProtocol
    ) {
        
        self.packsApi = packsApi
        self.productsApi = productsApi
    }
    
    func loadPacks() async throws -> [Pack] {
        return try await packsApi.loadPacks()
    }
    
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]] {
        return try await productsApi.loadProductsByCategory()
    }
}
