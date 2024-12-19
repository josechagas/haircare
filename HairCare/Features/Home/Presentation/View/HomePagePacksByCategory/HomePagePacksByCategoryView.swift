//
//  HomePagePacksByCategoryView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 20/06/22.
//

import SwiftUI

struct HomePagePacksByCategoryView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text(StoreItemCategory.packs.localizedName)
                .textCase(.uppercase)
                .padding([.leading, .trailing])
            ScrollView(.horizontal, showsIndicators: false, content: {
                LazyHStack(spacing: 20){
                    ForEach(0..<80) {index in
                        PackCardView()
                    }
                }
                .frame(height: 120)
                .padding([.leading, .trailing])
            })
        }
        .padding([.top, .bottom])
    }
}

#Preview {
    HomePagePacksByCategoryView()
}
