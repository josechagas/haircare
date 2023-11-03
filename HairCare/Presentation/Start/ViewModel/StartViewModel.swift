//
//  StartPageViewModel.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/12/22.
//

import Foundation

class StartViewModel: StartViewModelProtocol {
    @Published var showNextPage: Bool = false
    @Published var present: Bool = false
}
