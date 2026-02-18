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
        let repository = ItemsRepository(packsApi: PacksApiService(),
                                         productsApi: ProductsApiService())
        let packsUseCase = FetchPacksUseCase(repository: repository)
        let productsByCategoryUseCase = FetchProductsByCategoryUseCase(repository: repository)
        let viewModel = HomeViewModel(packsUseCase: packsUseCase,
                                      productsByCategoryUseCase: productsByCategoryUseCase)
        return HomePage(
            viewModel: viewModel
        )
    }
}
