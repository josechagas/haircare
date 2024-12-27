//
//  AppCoordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 01/12/22.
//

import Foundation
import SwiftUI

final class AppCoordinator: Coordinator {
    @Published var navigationPath: NavigationPath = NavigationPath()
    @Published var modalSheet: AppRoute?
    @Published var modalFullScreen: AppRoute? = .start
    
    lazy var children: [any Coordinator] = [
        ProfileCoordinator()
    ]

    func pageFor(route: AppRoute) -> some View {
        switch route {
        case .start:
            StartPageBuilder().build()
        case .home:
            HomeBuilder().build()
        case .productDetail(let product):
            ProductDetailBuilder(product: product).build()
        case .profile(let route):
            childPageFor(route: route, child: ProfileCoordinator.self)
        case .unauthorized:
            UnauthorizedBuilder().build()
        case .packDetail:
            EmptyView()
        }
    }

    func pathForDesired(route: AppRoute) -> [AppRoute] {
        if case .profile(let route) = route {
            return childPathForDesired(route: route,
                                       child: ProfileCoordinator.self,
                                       mapToSelfRoute: {AppRoute.profile(route: $0)})
        } else {
            return [route]
        }
    }

    func navigationAuthorization(route: AppRoute) -> RouteAuthorizationStatus {
        if case .profile(let route) = route {
            return childNavigationAuthorization(route: route,
                                                child: ProfileCoordinator.self)
        } else {
            return RouteAuthorizationStatus.authorized
        }
    }
}

extension AppCoordinator: NavigationDelegate {
    func navigate(route: AppRoute) {
        let authorization = navigationAuthorization(route: route)
        guard authorization.isAuthorized() else {
            modalFullScreen = AppRoute.unauthorized(with: authorization)
            return
        }
        let path = pathForDesired(route: route)
        path.forEach { route in
            switch route.presentationStyle {
            case .stack:
                navigationPath.append(route) //TODO: multiple appends at once, analize using an array instead of navigationPath
            case .fullScreenCover:
                modalFullScreen = route
            case .sheet:
                modalSheet = route
            }
        }
    }
}
