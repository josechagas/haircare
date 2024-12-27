//
//  AppNavigationStack.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 20/12/24.
//

import SwiftUI

struct AppNavigationStack: View {
    @StateObject private var appCoordinator: AppCoordinator = AppCoordinator()
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack(path: $appCoordinator.navigationPath) {
            appCoordinator.pageFor(route: .home)
                .navigationDestination(for: appCoordinator)
        }
        .fullScreenCover(item: $appCoordinator.modalFullScreen, content: { route in
            appCoordinator.pageFor(route: route)
        })
        .sheet(item: $appCoordinator.modalSheet, content: { route in
            appCoordinator.pageFor(route: route)
        })
        .environment(\.navigationDelegate, appCoordinator)
    }
}
