//
//  HomePageTabItem.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 15/06/22.
//

import SwiftUI

struct HomePageTabItem: View {    
    @Binding var selectedIndex: Int
    let index: Int
    let title: String
    
    private var isSelected:Bool {
        return selectedIndex == index
    }

    var body: some View {
        Button(action: {
            selectedIndex = index
        }, label: {
            Text(title)
                .font(Font.subheadline)

        })
            .textCase(.uppercase)
            .foregroundColor(Color.primary.opacity(isSelected ? 1 : 0.3))
            .padding([.leading,.trailing], 5)
            .padding([.top, .bottom], 8)
            .background {
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius: 2)
                        .frame(height: 2)
                        .foregroundColor(Color.accentColor)
                        .opacity(isSelected ? 1 : 0)
                }
            }
            .animation(.easeInOut, value: isSelected)
    }
}

#Preview {
    HomePageTabItem(
        selectedIndex: .constant(0),
        index: 0,
        title: "Teste 1"
    )
}
