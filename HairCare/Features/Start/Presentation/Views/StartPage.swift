//
//  StartPage.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 08/06/22.
//

import SwiftUI

struct StartPage<VModel: StartViewModelProtocol>: View, WithViewModel {
    
    @StateObject var viewModel: VModel
    
    var body: some View {
        ZStack {
            StartPageBackgroundView()
            VStack {
                Spacer()
                if viewModel.present {
                    StartPageBottomView(showNextPage: $viewModel.showNextPage)
                        .transition(
                            .move(edge: .bottom)
                                .combined(with: .opacity)
                        )
                }
            }
            .padding([.bottom], 80)
            .padding([.leading, .trailing], 10)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.2)) {
                viewModel.present = true
            }
        }
        .onDisappear {
            withAnimation(.easeInOut(duration: 1.2)) {
                viewModel.present = false
            }
        }
        .fullScreenCover(isPresented: $viewModel.showNextPage, onDismiss: nil, content: {
            AppCoordinator.shared.pageFor(route: .home)
        })
    }
}

#Preview {
    StartPage(viewModel: StartViewModel())
}
