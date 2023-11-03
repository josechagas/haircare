//
//  ApiRequestResponse.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 14/12/22.
//

import Foundation

struct ApiRequestResponse<Content: Codable>: Codable {
    let error: ErrorData?
    let data: Content?
}

struct ErrorData: Codable {
    let message: String
    let code: String
}
