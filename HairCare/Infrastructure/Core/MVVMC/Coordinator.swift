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

    var children: [any Coordinator] { get }
    
    @ViewBuilder
    func pageFor(route: Route) -> Page
    func navigationAuthorization(route: Route) -> Route.Authorization
}

@MainActor
protocol NavigationDelegate: ObservableObject {
    func navigate(route: any RouteProtocol)
}

protocol RouteProtocol: Hashable {
    associatedtype Authorization: AuthorizationProtocol
    static func unauthorized(with: Authorization) -> Self
}

extension RouteProtocol {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
        
    func hash(into hasher: inout Hasher) {
        let describing = String(describing: self)
        hasher.combine(describing.hashValue)
    }
}

protocol AuthorizationProtocol {
    func isAuthorized() -> Bool
}
