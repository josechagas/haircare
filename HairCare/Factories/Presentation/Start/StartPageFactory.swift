//
//  StartPageFactory.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 25/08/22.
//

import Foundation

@MainActor
class StartPageFactory {
    static func makeStartPage() -> StartPage<StartViewModel> {
        let viewModel: StartViewModel = StartViewModelFactory.makeStartViewModel()
        return StartPage(
            viewModel: viewModel
        )
    }
}
