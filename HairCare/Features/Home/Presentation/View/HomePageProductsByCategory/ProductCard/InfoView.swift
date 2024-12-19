//
//  NameCategoryView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/06/22.
//

import SwiftUI

struct InfoView: View {
    
    let category: String
    let name: String
    
    var body: some View {
        HStack {
            CategoryProductNameView(
                category: category, name: name
            )
            Spacer()
        }
    }
}

#Preview {
    InfoView(
        category: "Category", name: "Name"
    )
}
