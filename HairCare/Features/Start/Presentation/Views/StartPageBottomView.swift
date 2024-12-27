//
//  StartPageBottomView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 10/06/22.
//

import SwiftUI

struct StartPageBottomView: View {

    @Environment(\.dismiss) var dismissAction

    var body: some View {
        VStack(spacing: 40) {
            BigLogoView()
            Button(
                action: {
                    dismissAction()
                }) {
                    Text(R.string.startPage.get_started())
                        .padding([.leading, .trailing], 20)
                        .padding([.top, .bottom], 5)
                }
                .buttonStyle(.outlined
                                .cornerRadius(.infinity)
                                .lineWidth(1))
                .foregroundColor(Color.primary)
        }
    }
}

#Preview {
    StartPageBottomView()
}
