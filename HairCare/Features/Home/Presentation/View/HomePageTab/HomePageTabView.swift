//
//  HomePageTabs.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 14/06/22.
//

import SwiftUI

struct HomePageTabView: View {
    
    @Binding var selectedIndex: Int {
        mutating willSet {
            oldSelectedIndex = selectedIndex
        }
    }
    
    private var oldSelectedIndex: Int
    
    private let categories: [StoreItemCategory]
    private let firstIndex: Int
    private let lastIndex: Int

    
    init(selectedIndex: Binding<Int>) {
        self._selectedIndex = selectedIndex
        oldSelectedIndex = selectedIndex.wrappedValue
        categories = StoreItemCategory.allCases
        firstIndex = 0
        lastIndex = categories.count - 1
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 10){
                    ForEach(categories, id: \.self) { category in
                        HomePageTabItem(
                            selectedIndex: $selectedIndex,
                            index: category.index,
                            title: category.localizedName
                        )
                        .id(category.index)
                    }
                }
                .padding([.leading, .trailing])
            }
            .padding([.top])
            .padding([.bottom], 0)
            .onChange(of: selectedIndex, perform: { index in
                withAnimation {
                    let anchor: UnitPoint
                    switch(index){
                    case firstIndex:
                        anchor = UnitPoint.trailing
                    case lastIndex:
                        anchor = UnitPoint.trailing
                    default:
                        anchor = UnitPoint.center
                    }
                    proxy.scrollTo(index, anchor: anchor)
                }
            })
        }
    }
}

#Preview {
    HomePageTabView(
        selectedIndex: .constant(0)
    )
}
