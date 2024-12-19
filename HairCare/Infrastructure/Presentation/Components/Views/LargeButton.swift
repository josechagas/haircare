//
//  LargeBorderedProminentButton.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 30/06/22.
//

import SwiftUI

struct LargeButton<Content>: View where Content: View {
    var action: ()->Void
    var label: ()->Content
    
    var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                label()
                    .padding(8)
                Spacer()
            }
        }
    }
}

#Preview {
    VStack {
        LargeButton(
            action: {}, label: {
                Text("Testando")
            })
            .buttonStyle(.borderedProminent)
            .padding()
        
        LargeButton(
            action: {}, label: {
                Text("Testando")
            })
            .buttonStyle(.bordered)
            .padding()
    }
}
