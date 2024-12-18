//
//  RoundedCornersShape.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 29/06/22.
//

import SwiftUI

struct RoundedCornersShape: Shape {
    let corners: UIRectCorner
    let radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct RoundedCornersShape_Previews: PreviewProvider {
    static var previews: some View {
        Text("Testando")
            .padding()
            .background {
                RoundedCornersShape(
                    corners: [.topLeft, .topRight],
                    radius: 10
                )
                    .fill(Color.gray)
            }
    }
}
