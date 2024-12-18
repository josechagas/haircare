//
//  ApiCallMock.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 13/12/22.
//

import Foundation

protocol ApiCallMock {
    var statusCode: Int {get}
    var error: Error? {get}
    var data: Data? {get}
}

extension ApiCallMock where Self: URLProtocol {
    func mockLoading () {
        if let url = request.url {
            let response = HTTPURLResponse(url: url, statusCode: statusCode, httpVersion: nil, headerFields: nil)
            client?.urlProtocol(self, didReceive: response ?? HTTPURLResponse(), cacheStoragePolicy: .notAllowed)
        }

        if let error {
            client?.urlProtocol(self, didFailWithError: error)
        } else if let data {
            client?.urlProtocol(self, didLoad: data)
        }

        client?.urlProtocolDidFinishLoading(self)
    }
}
