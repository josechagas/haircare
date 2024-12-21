//
//  Coordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 01/12/22.
//

import SwiftUI

///Definition of Coodinator
///The one responsable for instanciating all the app pages or ViewControllers
@MainActor
protocol Coordinator {
    associatedtype Page: View
    associatedtype Route: RouteProtocol

    @ViewBuilder
    func pageFor(route: Route) -> Page
    func navigationAuthorization(route: Route) -> Route.Authorization
}

@MainActor
protocol NavigationDelegate {
    associatedtype DelegateRoute: Hashable
    func navigate(route: DelegateRoute)
}

protocol RouteProtocol: Hashable {
    associatedtype Authorization: AuthorizationProtocol
    static func unauthorized(with: Authorization) -> Self
}

protocol AuthorizationProtocol {
    func isAuthorized() -> Bool
}
