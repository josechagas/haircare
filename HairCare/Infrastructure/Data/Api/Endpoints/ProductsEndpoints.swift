//
//  ProductEndpoints.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/12/22.
//

import Foundation

enum ProductsEndpoints {
    case productsByCategory
    case newProducts
}

extension ProductsEndpoints: ApiRequestMaker {
    func makeRequest() -> ApiRequest {
        let body: Codable?
        let endpoint: String
        let httpMethod: ApiRequestMethod
        let headers: ApiRequestHeaders?
        
        switch self {
        case .productsByCategory:
            endpoint = "products/by-categories"
            httpMethod = .get
            body = nil
            headers = nil
        case .newProducts:
            endpoint = "products/new"
            httpMethod = .get
            body = nil
            headers = nil
        }
        
        var request = ApiRequest(endpoint: endpoint, method: httpMethod, body: body)
        request.addHeaders(headers: headers)
        return request
    }
}

