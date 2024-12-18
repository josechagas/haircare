//
//  ApiMockURLProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 13/12/22.
//

import Foundation

class ApiProductsByCategoryMockUrlProtocol: URLProtocol, ApiCallMock {
    
    let statusCode: Int = 200
    let error: Error? = nil
    let data: Data? = ApiMockLoader.loadProductsByCategory()
    
    override class func canInit(with request: URLRequest) -> Bool {
        if let url = request.url {
            return url.relativePath == "/api/products/by-categories"
        }
        return false
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        mockLoading()
    }
    
    override func stopLoading() {

    }
}
