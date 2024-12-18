//
//  HomeBuilder.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/12/24.
//

@MainActor
struct HomeBuilder {
    func build() -> View {
        let repository = HomeRepository(packsApi: PacksApiService(),
                                        productsApi: ProductsApiService())
        let useCase = HomeUseCase(repository: repository)
        let viewModel = HomeViewModel(viewStoreItemsUseCase: useCase)
        return HomePage(
            viewModel: viewModel
        )
    }
}
