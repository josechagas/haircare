//
//  ApiRequest.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/12/22.
//

import Foundation

typealias ApiRequestHeaders = [String: String?]

struct ApiRequest {
    
    let endpoint: String
    let method: ApiRequestMethod
    let body: Codable?
    var requiresAuthentication: Bool
    private(set) var headers: ApiRequestHeaders = [:]
    
    init(endpoint: String, method: ApiRequestMethod, body: Codable?) {
        self.endpoint = endpoint
        self.method = method
        self.body = body
        self.requiresAuthentication = false
        addDefaultHeaders()
    }
    
    private mutating func addDefaultHeaders() {
        headers = [:]
    }
    
    mutating func addHeaders(headers: ApiRequestHeaders?) {
        guard let headers = headers else {
            return
        }
        self.headers.merge(headers) { defaultValue, newValue in
            return newValue
        }
    }
}

protocol ApiRequestMaker {
    func makeRequest() -> ApiRequest
}

enum ApiRequestMethod: String {
    case get = "GET"
    case delete = "DELETE"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
}

enum ApiRequestError: Error {
    case invalidUrlPath(path: String)
    case requestFailed(statusCode: Int, errorBody: ErrorData?)
    case unknownError
}
