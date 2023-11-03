//
//  ApiRequest+ErrorHandling.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 14/12/22.
//

import Foundation

extension ApiRequest {
    func execute<Content: Codable>(urlSession: URLSession = URLSession.shared) async throws -> Content? {
        let urlRequest = try makeURLRequest()
        let (data, response) = try await urlSession.data(for: urlRequest)
        let responseBody: ApiRequestResponse<Content> = try JSONDecoder().decode(ApiRequestResponse<Content>.self, from: data)
        
        try validateURLResponse(response: response as? HTTPURLResponse, errorBody: responseBody.error)
        
        return responseBody.data
    }
    
    private func makeURLRequest() throws -> URLRequest {
        guard let baseURL = URL(string: EnvVariables.instance.baseUrl),
              let encodedUrl = endpoint.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed),
              let url = URL(string: encodedUrl, relativeTo: baseURL) else {
            throw ApiRequestError.invalidUrlPath(path: endpoint)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        headers.forEach { tuple in
            request.setValue(tuple.value, forHTTPHeaderField: tuple.key)
        }
        if let body = body {
            request.httpBody = try JSONEncoder().encode(body)
        }
        return request
    }
    
    private func validateURLResponse(response: HTTPURLResponse?, errorBody: ErrorData?) throws {
        guard let statusCode = response?.statusCode else {
            throw ApiRequestError.unknownError
        }
        let successfulResponse = isSuccessStatusCode(statusCode: statusCode)
        if !successfulResponse {
            throw ApiRequestError.requestFailed(statusCode: statusCode, errorBody: errorBody)
        }
    }
    
    private func isSuccessStatusCode(statusCode: Int) -> Bool {
        return (200...299).contains(statusCode)
    }
}

//TODO: This is just an example, but must be moved to presentation layer for a better usage of architecture
extension ApiRequestError {
    var localizedMessage: String {
        let message: String
        switch self {
        case .invalidUrlPath:
            message = "Could not execute the request. Please try again later"
            
        case .unknownError:
            message = "Unexpected error. We are now working to fix it"

        case .requestFailed(let statusCode, _) where statusCode == 401:
            message = "Expired authentication. Please sign in again."

        case .requestFailed(let statusCode, _) where (500...599).contains(statusCode):
            message = ""

        default:
            message = "Could not execute the request. Please try again later"
        }
        return message
    }
}
