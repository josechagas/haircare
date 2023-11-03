//
//  HomeViewModelFactory.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/08/22.
//

import Foundation

@MainActor
class HomeViewModelFactory {
    static func makeHomeViewModel()-> HomeViewModel {
        let useCase = ViewStoreItemsUseCaseFactory.makeViewStoreItemsUseCase()
        return HomeViewModel(viewStoreItemsUseCase: useCase)
    }
}
