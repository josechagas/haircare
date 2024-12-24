//
//  AppNavigationStack.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 20/12/24.
//

import SwiftUI

struct AppNavigationStack: View {
    @Binding var navigationPath: NavigationPath
    @State private var presentStartModal: Bool = false
    @State private var navigationDelegate: AppNavigationDelegate
    
    private var appCoordinator: AppCoordinator = AppCoordinator()
    
    init(navigationPath: Binding<NavigationPath>) {
        self._navigationPath = navigationPath
        self.navigationDelegate = AppNavigationDelegate(navigationPath: navigationPath)
    }

    var body: some View {
        NavigationStack(path: $navigationPath) {
            appCoordinator.pageFor(route: .home)
                .navigationDestination(for: appCoordinator)
        }
        .fullScreenCover(isPresented: $presentStartModal) {
            appCoordinator.pageFor(route: .start)
        }
        .environmentObject(navigationDelegate)
    }
}
