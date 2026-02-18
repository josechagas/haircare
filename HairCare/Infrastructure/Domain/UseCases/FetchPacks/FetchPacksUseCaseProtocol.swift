
//
//  FetchPacksUseCaseProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 03/12/25.
//


protocol FetchPacksUseCaseProtocol: UseCase {
    func execute() async throws -> [Pack]
}
