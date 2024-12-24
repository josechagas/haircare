//
//  AppCoordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 01/12/22.
//

import Foundation
import SwiftUI

struct AppCoordinator: Coordinator {
    let children: [any Coordinator] = [
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
            if let coordinator = children.first(where: ProfileCoordinator.self) {
                coordinator.pageFor(route: route)
            } else {
                EmptyView()
            }
        case .unauthorized:
            UnauthorizedBuilder().build()
        case .packDetail:
            EmptyView()
        }
    }
    
    func navigationAuthorization(route: AppRoute) -> RouteAuthorizationStatus {
        .authorized
    }
}
