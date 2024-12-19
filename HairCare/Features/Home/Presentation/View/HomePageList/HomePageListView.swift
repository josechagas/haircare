//
//  HomePageListView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 09/12/22.
//

import SwiftUI

struct HomePageListView<VModel: HomeListViewModelProtocol>: View, WithViewModel  {
    
    @EnvironmentObject var viewModel: VModel
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                Section(content: {
                    ForEach(StoreItemCategory.allCases, id: \.self) { category in
                        if category == .packs {
                            HomePagePacksByCategoryView()
                                .id(category.index)
                        } else {
                            HomePageProductsByCategoryView(
                                category: category,
                                products: viewModel.productsByCategory?[category]
                            )
                            .id(category.index)
                        }
                    }
                    .padding(.top, 30)
                }, header: {
                    HomePageTabView(
                        selectedIndex: $viewModel.selectedTabIndex
                    )
                })
                .listRowInsets(
                    EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                )
                .listRowSeparator(.hidden)
                .listSectionSeparator(.hidden)
            }
            .onChange(of: viewModel.selectedTabIndex, perform: { newValue in
                onSelectedTabIndexChange(newTabIndex: newValue, proxy: proxy)
            })
        }
        .listStyle(.plain)
        .refreshable(action: refreshableAction)
    }
    
    private func onSelectedTabIndexChange(newTabIndex: Int, proxy: ScrollViewProxy) {
        withAnimation {
            proxy.scrollTo(StoreItemCategory.allCases[newTabIndex].index, anchor: UnitPoint.top)
        }
    }
    
    @Sendable
    private func refreshableAction() async {
        await viewModel.refreshInformations()
    }
}

#Preview {
    class HomeListViewModelPreview: HomeListViewModelProtocol {
        var selectedTabIndex: Int = 0
        var productsByCategory: [StoreItemCategory : [Product]]? = [
            .conditioner: [
                .init(id: "1",
                      name: "Some name",
                      imageUrl: nil,
                      category: .conditioner,
                      price: .init(valueInCents: 9000,
                                   currency: "R$"))
            ]
        ]
        var packs: [Pack]? = []
        var refreshInformationsStatus: ExecutionStatus = .none
        func refreshInformations() async {}
    }
    
    let viewModel = HomeListViewModelPreview()
    return HomePageListView<HomeListViewModelPreview>()
        .environmentObject(viewModel)
}
