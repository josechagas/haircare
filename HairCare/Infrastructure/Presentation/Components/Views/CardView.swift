//
//  CardView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 19/06/22.
//

import SwiftUI

struct CardView<Content>: View where Content: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    private let cornerRadius: CGFloat
    private let color: Color?
    private let content:Content
    
    private var defaultColor: Color? {
        R.color.cardBackground()?.swiftUIColor
    }
    
    init(
        cornerRadius: CGFloat = 20,
        color: Color? = nil,
        @ViewBuilder content:()->Content
    ) {
        self.cornerRadius = cornerRadius
        self.color = color
        self.content = content()
    }

    
    var body: some View {
        content
            .cornerRadius(cornerRadius)
            .background {
                RoundedRectangle(
                    cornerRadius: cornerRadius, style: .continuous
                )
                    .foregroundColor(color ?? defaultColor)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0.5, y: 0.5)
            }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView {
            Text("Um texto")
                .padding(20)
        }
        .foregroundColor(Color.red)
    }
}
