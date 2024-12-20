//
//  AppNavigationStack.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 20/12/24.
//

import SwiftUI

struct AppNavigationStack: View {
    @State var navigationPath: NavigationPath = NavigationPath()
    @State var presentStartModal: Bool = false

    private let appCoordinator: AppCoordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            appCoordinator.pageFor(route: .home)
                .navigationDestination(for: AppRoute.self) { route in
                    appCoordinator.pageFor(route: route)
                }
        }
        .fullScreenCover(isPresented: $presentStartModal) {
            appCoordinator.pageFor(route: .start)
        }
    }
}
