//
//  CategoryProductNameView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 22/06/22.
//

import SwiftUI

struct CategoryProductNameView: View {
    
    private let category: String
    private let name: String
    private let style: CategoryProductNameView.Style
    
    init(category: String, name: String, style: CategoryProductNameView.Style = .medium){
        self.category  = category
        self.name = name
        self.style = style
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category)
                .font(categoryFont(style: style))
                .fontWeight(Font.Weight.medium)
                .textCase(.uppercase)
                .foregroundColor(Color.accentColor)
            Text(name)
                .font(nameFont(style: style))
                .fontWeight(Font.Weight.light)
        }
    }
}

#Preview {
    VStack(spacing: 40) {
        CategoryProductNameView(
            category: "Category", name: "Hair Strength", style: .small
        )
        CategoryProductNameView(
            category: "Category", name: "Hair Strength", style: .medium
        )
        CategoryProductNameView(
            category: "Category", name: "Hair Strength", style: .large
        )
    }
}

extension CategoryProductNameView {
    enum Style {
        case small, medium, large
    }
    
    fileprivate func categoryFont(style: CategoryProductNameView.Style)-> Font {
        switch(style) {
        case .small:
            return Font.caption2
        case .medium:
            return Font.footnote
        case .large:
            return Font.subheadline
        }
    }
    
    fileprivate func nameFont(style: CategoryProductNameView.Style)-> Font {
        switch(style) {
        case .small:
            return Font.callout
        case .medium:
            return Font.title3
        case .large:
            return Font.title
        }
    }
}
