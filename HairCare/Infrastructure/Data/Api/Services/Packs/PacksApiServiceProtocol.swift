//
//  PacksApiServiceProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/08/22.
//

import Foundation

protocol PacksApiServiceProtocol: ApiService {
    func loadPacks() async throws -> [Pack]
}
