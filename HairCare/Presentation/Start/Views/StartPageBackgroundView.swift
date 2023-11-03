//
//  StartPageBackgroundView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 09/06/22.
//

import SwiftUI

struct StartPageBackgroundView: View {
    var body: some View {
        Image(R.image.startPageBackground.name)
            .resizable()
            .ignoresSafeArea()
            .scaledToFill()
            .overlay(
                LinearGradient(
                    gradient: SwiftUI.Gradient(
                        colors: [Color.systemBackground.opacity(0), Color.systemBackground]
                    ),
                    startPoint: SwiftUI.UnitPoint(x: 0.5, y: 0.10),
                    endPoint: SwiftUI.UnitPoint(x: 0.5, y: 1)
                )
            )
    }
}

struct StartPageBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageBackgroundView()
            
    }
}
