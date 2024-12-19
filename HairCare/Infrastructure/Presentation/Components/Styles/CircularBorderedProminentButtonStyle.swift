//
//  CircularBorderedProiminentButtonStyle.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 18/06/22.
//

import SwiftUI

struct CircularBorderedProminentButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .opacity(configuration.isPressed ? 0.25 : 1)
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: .infinity, style: .circular)
                    .foregroundColor(Color.accentColor)
            }
    }
}

#Preview {
    VStack {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "plus")
            })
            .buttonStyle(.circularBorderedPromiment)
        }
        
        Button(action: {}, label: {
            Label("Adicionar", systemImage: "plus")
                .labelStyle(.titleAndIcon)
        })
            .buttonStyle(.circularBorderedPromiment)
        
        Button(action: {}, label: {
            Text("Adicionar")
        })
            .buttonStyle(.circularBorderedPromiment)
    
    }
}

extension ButtonStyle where Self == OutlinedButtonStyle {
    static var circularBorderedPromiment: CircularBorderedProminentButtonStyle {
        CircularBorderedProminentButtonStyle()
    }
}
