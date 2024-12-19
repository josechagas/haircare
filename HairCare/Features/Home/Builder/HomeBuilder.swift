//
//  HomeBuilder.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/12/24.
//

import SwiftUI

@MainActor
struct HomeBuilder {
    func build() -> some View {
        let repository = HomeRepository(packsApi: PacksApiService(),
                                        productsApi: ProductsApiService())
        let useCase = HomeUseCase(repository: repository)
        let viewModel = HomeViewModel(homeUseCase: useCase)
        return HomePage(
            viewModel: viewModel
        )
    }
}
