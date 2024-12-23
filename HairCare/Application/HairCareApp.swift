//
//  HairCareApp.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 08/06/22.
//

import SwiftUI

@main
struct HairCareApp: App {
    @State private var cartService: CartService = CartService()
    @State private var navigationPath: NavigationPath = NavigationPath()

    var body: some Scene {
        WindowGroup {
            AppNavigationStack(navigationPath: $navigationPath)
                .environmentObject(cartService)
        }
    }
}
