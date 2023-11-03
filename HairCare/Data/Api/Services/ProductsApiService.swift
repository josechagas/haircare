//
//  ProductsApiService.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 04/07/22.
//

import Foundation

struct ProductsApiService: ProductsApiServiceProtocol {
    func loadProductsByCategory() async throws -> [StoreItemCategory : [Product]] {
        try await Task.sleep(nanoseconds: 1 * 1_000_000_000)
                        
        let configuration = URLSessionConfiguration.default
        configuration.protocolClasses = [ApiProductsByCategoryMockUrlProtocol.self]
        let mockedUrlSession = URLSession(configuration: configuration)
        
        let request: ApiRequest = ProductsEndpoints.productsByCategory.makeRequest()
        let result: [String : [Product]]? = try await request.execute(urlSession: mockedUrlSession)
        
        var responseData: [StoreItemCategory : [Product]] = [:]

        result?.forEach { tuple in
            if let category = StoreItemCategory(rawValue: tuple.key) {
                responseData[category] = tuple.value
            }
        }
        
        return responseData
    }
}
