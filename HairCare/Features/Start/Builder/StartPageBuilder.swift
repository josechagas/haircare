//
//  StartPageBuilder.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/12/24.
//

import SwiftUI

@MainActor
struct StartPageBuilder {
    func build() -> some View {
        let viewModel = StartViewModel()
        return StartPage(
            viewModel: viewModel
        )
    }
}
