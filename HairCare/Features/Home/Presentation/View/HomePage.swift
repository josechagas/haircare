//
//  HomePage.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 10/06/22.
//

import SwiftUI

struct HomePage<VModel: HomeViewModelProtocol>: View, WithViewModel {
    
    @StateObject var viewModel: VModel
    
    var body: some View {
        HomePageNavigationPath {
            Group {
                switch(viewModel.loadInformationsStatus) {
                case .none, .inProgress:
                    ExecutionInProgressView()
                        .transition(.opacity)
                case .success:
                    HomePageListView<VModel>()
                    .transition(.opacity)
                    .environmentObject(viewModel)
                case .failed:
                    ExecutionResultView(
                        message: "Failed to load products",
                        topImageSystemName: "exclamationmark.triangle",
                        actionsContent: DefaultActionsContent(
                            title: "Action button title",
                            action: {
                                Task {
                                    await viewModel.loadInformations()
                                }
                            }
                        )
                    )
                    .transition(.opacity)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ProfileImageView(
                        size: 35
                    )
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button(action: {

                    }, label: {
                        Image(systemName: "magnifyingglass")
                    })
                    Button(action: {

                    }, label: {
                        Image(systemName: "ellipsis")
                            .rotationEffect(Angle.degrees(90))
                    })
                }
            }
            .navigationTitle(R.string.homePage.new_collection())
        }
        .animation(.easeInOut, value: viewModel.loadInformationsStatus)
        .task {
            await viewModel.loadInformations()
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(
            viewModel: HomeViewModelFactory.makeHomeViewModel()
        )
    }
}
