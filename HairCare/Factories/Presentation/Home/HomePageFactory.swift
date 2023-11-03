//
//  HomePageFactory.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 19/08/22.
//

import Foundation

@MainActor
class HomePageFactory {
    static func makeHomePage() -> HomePage<HomeViewModel> {
        let viewModel = HomeViewModelFactory.makeHomeViewModel()
        return HomePage(
            viewModel: viewModel
        )
    }
}
