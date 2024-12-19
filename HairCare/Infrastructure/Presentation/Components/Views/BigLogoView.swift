//
//  BigLogoView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 09/06/22.
//

import SwiftUI

struct BigLogoView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10){
            Text("Natural Essence")
                .font(.title)
                .padding([.top, .bottom], 12)
                .background {
                    VStack {
                        HStack {
                            Spacer()
                            Rectangle()
                                .foregroundColor(Color.accentColor)
                                .frame(width: 95, height: 2)
                        }
                        Spacer()
                        HStack {
                            Rectangle()
                                .foregroundColor(Color.accentColor)
                                .frame(width: 40, height: 2)
                            Spacer()
                        }
                    }
                }
            Text("Hair Care")
                .font(.title3)
                .textCase(.uppercase)
        }
    }
}

#Preview {
    BigLogoView()
}
