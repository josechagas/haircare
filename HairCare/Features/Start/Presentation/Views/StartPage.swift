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
                .transition(.opacity)
            VStack {
                Spacer()
                if viewModel.present {
                    StartPageBottomView()
                        .transition(
                            .move(edge: .bottom)
                                .combined(with: .opacity)
                        )
                }
            }
            .padding([.bottom], 80)
            .padding([.leading, .trailing], 10)
            .animation(.easeInOut(duration: 1.2), value: viewModel.present)
        }
        .onAppear {
            viewModel.present = true
        }
        .onDisappear {
            viewModel.present = false
        }
    }
}

#Preview {
    StartPage(viewModel: StartViewModel())
}
