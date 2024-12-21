//
//  View+Coordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 21/12/24.
//

import SwiftUI

extension View {
    @ViewBuilder
    func navigationDestination<C>(for coordinator: C) -> some View where C: Coordinator {
        self
            .navigationDestination(for: C.Route.self) { route in
                let authorization = coordinator.navigationAuthorization(route: route)
                let finalRoute: C.Route = if authorization.isAuthorized() {
                    route
                } else {
                    .unauthorized(with: authorization)
                }
                coordinator.pageFor(route: finalRoute)
            }
    }
}
