//
//  ProductsApiServiceProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 04/07/22.
//

import Foundation


protocol ProductsApiServiceProtocol: ApiService {
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]]
}
