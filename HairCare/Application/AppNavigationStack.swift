//
//  AppNavigationStack.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 20/12/24.
//

import SwiftUI

struct AppNavigationStack: View {
    @State var presentStartModal: Bool = false
    @State var appCoordinator: AppCoordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $appCoordinator.navigationPath) {
            appCoordinator.pageFor(route: .home)
                .navigationDestination(for: appCoordinator)
        }
        .fullScreenCover(isPresented: $presentStartModal) {
            appCoordinator.pageFor(route: .start)
        }
    }
}
