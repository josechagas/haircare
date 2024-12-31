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
    
    ///Build the ``Page`` for the **parameter route**
    ///
    ///- parameter route: The route that represents a View you want to navigate to.
    ///- returns: An instance of ``Page``
    ///
    ///> Important: This method must not perform any kind of authorization. So it is important to be called
    ///after calling ``Coordinator/navigationAuthorization(route:)`` and
    ///this method return ``AuthorizationProtocol/isAuthorized()`` equal **TRUE**.
    @ViewBuilder
    func pageFor(route: Route) -> Page
    ///Determine the path necessary to be appendded on stack based on desired **parameter route**
    ///
    ///- parameter route: The route that represents a View you want to navigate to.
    ///- returns: A list of routes, that must be added behind **parameter route**. The list of routes should contain **parameter route**.
    ///
    ///The list will contain 1 or more items depending on **Application Business Rules**.
    ///It is expected that this method will be called after authorization validation by calling ``Coordinator/navigationAuthorization(route:)``
    ///
    ///> Important: The list must be in the correct navigation order.
    ///
    func pathForDesired(route: Route) -> [Route]
    ///Determine if navigation to desired **parameter route**  is or not possible  based on **Application Business Rules**
    ///
    ///- parameter route: The route that represents a ``View`` you want to navigate to.
    ///- returns: The authorization status
    func navigationAuthorization(route: Route) -> Route.Authorization
}

@MainActor
extension Coordinator {
    ///Delegate to a child coordinator the creation of corresponding View
    ///
    ///- parameter route: The child route you want to navigate to
    ///- parameter child: The child coordinator type
    ///- returns: The instance of View that represents the **parameter route**
    ///
    ///> Important: This method must only be called inside ``Coordinator/pageFor(route:)`` as
    ///part of the routine to build the ``Page`` that represents the **parameter route**
    @ViewBuilder
    func childPageFor<Child: Coordinator>(route: Child.Route,
                                          child: Child.Type) -> some View {
        if let coordinator = children.first(where: Child.self) {
            coordinator.pageFor(route: route)
        } else {
            EmptyView()
        }
    }
    ///Delegate to a child coordinator the definition the path necessary to navigate to the **desired route**
    ///
    ///- parameter route: The child route you want to navigate to
    ///- parameter child: The child coordinator type
    ///- parameter mapToSelfRoute: A clousure that encapsulates the Child.Route into the Self.Route.
    ///- returns: The path necessary to navigate to the **desired route**
    ///
    ///> Important: This method must only be called inside ``Coordinator/pathForDesired(route:)`` as
    ///part of the routine to determine the path necessary to navigate to **parameter route**
    func childPathForDesired<Child: Coordinator>(route: Child.Route,
                                                 child: Child.Type,
                                                 mapToSelfRoute: (Child.Route) -> Self.Route) -> [Self.Route] {
        guard let coordinator = children.first(where: Child.self) else {
            return [.unauthorized(with: .unknownRoute)]
        }
        return coordinator.pathForDesired(route: route).map(mapToSelfRoute)
    }
    ///Delegate to a child coordinator the definition of authorization status to navigate to the **desired route**
    ///
    ///- parameter route: The child route you want to navigate to
    ///- parameter child: The child coordinator type
    ///- returns: The authorization status or ``AuthorizationProtocol/unknownRoute`` if the child coordinator does not exists on ``children``
    ///
    ///> Important: This method must only be called inside ``Coordinator/navigationAuthorization(route:)`` as
    ///part of the routine to determine the authorization to navigate to **parameter route**
    func childNavigationAuthorization<Child: Coordinator>(route: Child.Route,
                                                          child: Child.Type) -> Child.Route.Authorization {
        guard let coordinator = children.first(where: Child.self) else {
            return .unknownRoute
        }
        return coordinator.navigationAuthorization(route: route)
    }
}

@MainActor
protocol NavigationDelegate<DelegateRoute>: ObservableObject {
    associatedtype DelegateRoute: RouteProtocol
    func navigate(route: DelegateRoute)
}
