//
//  ProfileImageView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 14/06/22.
//

import SwiftUI

struct ProfileImageView: View {
    
    let size: CGFloat
    
    var body: some View {
        AsyncImage(
            url: URL(string: "https://picsum.photos/300"), content: { image in
            image.resizable()
                    .transition(.opacity)
        }, placeholder: {
            R.color.asyncImagePlaceholder()?.swiftUIColor
        })
            .frame(width: size, height: size)
            .cornerRadius(size/2.0)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView(
            size: 120
        )
    }
}
