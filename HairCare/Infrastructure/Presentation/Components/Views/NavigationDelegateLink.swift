//
//  NavigationDelegateLink.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 29/12/24.
//

import SwiftUI

struct NavigationDelegateLink<Content>: View where Content: View {
    
    @Environment(\.navigationDelegate) private var navigationDelegate: (any NavigationDelegate<AppRoute>)?
    private let destination: AppRoute
    private let content: () -> Content
    
    init(destination: AppRoute,
         content: @escaping () -> Content) {
        self.destination = destination
        self.content = content
    }
    
    var body: some View {
        Button(action: {
            navigationDelegate?.navigate(route: destination)
        }, label: content)
        .buttonStyle(PlainButtonStyle())
    }
}
