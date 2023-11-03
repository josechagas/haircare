//
//  StoreItemsRepositoryProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 19/08/22.
//

import Foundation

protocol StoreItemsRepositoryProtocol: Repository {
    func loadPacks() async throws -> [Pack]
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]]
}
