//
//  AppRoute.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 23/12/24.
//

enum AppRoute: RouteProtocol {
    case start
    case home
    case productDetail(product: Product)
    case packDetail(pack: Pack)
    case profile(route: ProfileRoute)
    case unauthorized(with: RouteAuthorizationStatus)
}

extension AppRoute {
    var presentationStyle: PresentationStyle {
        switch self {
        case .start:
                .fullScreenCover
        case .home:
                .stack
        case .productDetail:
                .stack
        case .packDetail:
                .stack
        case .profile(let route):
            route.presentationStyle
        case .unauthorized:
                .sheet
        }
    }
}
