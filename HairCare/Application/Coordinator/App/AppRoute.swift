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
