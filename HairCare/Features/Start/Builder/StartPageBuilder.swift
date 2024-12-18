//
//  StartPageBuilder.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/12/24.
//

@MainActor
struct StartPageBuilder {
    func build() -> View {
        let viewModel = StartViewModel()
        return StartPage(
            viewModel: viewModel
        )
    }
}
