//
//  FixedBottomSheetView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 24/06/22.
//

import SwiftUI

struct FixedBottomSheetView<Content, BottomSheetContent>: View where Content: View, BottomSheetContent: View {
    
    private let content: Content
    private let bottomSheetContent: BottomSheetContent
    private let cornerRadius: CGFloat = 20
    
    private var backgroundColor: Color {
        R.color.cardBackground()?.swiftUIColor ?? Color.systemBackground
    }

    init(content: ()-> Content, bottomSheetContent: ()-> BottomSheetContent) {
        self.content = content()
        self.bottomSheetContent = bottomSheetContent()
    }
    
    var body: some View {
        VStack(spacing: 0){
            content
                .padding([.bottom], -5)
            Spacer()
            HStack {
                Spacer()
                bottomSheetContent
                Spacer()
            }
                .padding()
                .padding([.top, .bottom], 15)
                .background {
                    RoundedCornersShape(
                        corners: [.topLeft, .topRight],
                        radius: cornerRadius
                    )
                        .fill(backgroundColor)
                        .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: -2)
                }
        }
    }
}

#Preview {
    FixedBottomSheetView(
        content: {
            Text("Teste 2")
        }, bottomSheetContent: {
            Text("Bottom sheet teste 1")
        })
}
