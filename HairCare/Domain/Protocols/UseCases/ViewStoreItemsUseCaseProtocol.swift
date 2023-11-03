//
//  ViewStoreItemsUseCaseProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 25/08/22.
//

import Foundation

protocol ViewStoreItemsUseCaseProtocol: UseCase {
    func loadPacks() async throws -> [Pack]
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]]
}
