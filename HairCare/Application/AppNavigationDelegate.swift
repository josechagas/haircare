//
//  AppNavigationDelegate.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 23/12/24.
//

import SwiftUI

final class AppNavigationDelegate: ObservableObject, NavigationDelegate {
    @Binding var navigationPath: NavigationPath
    
    init(navigationPath: Binding<NavigationPath>) {
        self._navigationPath = navigationPath
    }
    
    func navigate(route: any RouteProtocol) {
        navigationPath.append(route)
    }
}
