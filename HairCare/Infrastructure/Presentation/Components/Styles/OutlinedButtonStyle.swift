//
//  OutlinedButtonStyle.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 09/06/22.
//

import SwiftUI


struct OutlinedButtonStyle: ButtonStyle {

    fileprivate var cornerRadius: CGFloat = 5
    fileprivate var lineWidth: CGFloat = 2
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding([.leading, .trailing], 10)
            .padding([.top, .bottom], 5)
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(lineWidth: lineWidth)
            }
            .opacity(configuration.isPressed ? 0.25 : 1)
    }
    
    func cornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }

    func lineWidth(_ width: CGFloat) -> Self {
        var copy = self
        copy.lineWidth = width
        return copy
    }

}

#Preview {
    VStack {
        Button(action: {}, label: {
            Image(systemName: "plus")
        })
            .buttonStyle(.outlined
                            .cornerRadius(.infinity)
                            .lineWidth(2))
        
        Button("Teste") {
            
        }.buttonStyle(.outlined
                        .cornerRadius(.infinity)
                        .lineWidth(2)
        )
        
        Button(action: {}, label: {
            Label("Adicionar", systemImage: "plus")
                .labelStyle(.titleAndIcon)
        })
            .buttonStyle(.outlined
                            .cornerRadius(.infinity))
    }
}

extension ButtonStyle where Self == OutlinedButtonStyle {
    static var outlined: OutlinedButtonStyle {
        OutlinedButtonStyle()
    }
}
