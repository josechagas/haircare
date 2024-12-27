//
//  ProfileCoordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 23/12/24.
//

import SwiftUI

struct ProfileCoordinator: Coordinator {
    
    var children: [any Coordinator] = []
    
    func pageFor(route: ProfileRoute) -> some View {
        switch route {
        case .profile:
            Text("profile")
        case .edit:
            Text("edit profile")
        case .unauthorized:
            UnauthorizedBuilder().build()
        }
    }
    
    func pathForDesired(route: ProfileRoute) -> [ProfileRoute] {
        let authorization = navigationAuthorization(route: route)
        guard authorization.isAuthorized() else {
            return [ProfileRoute.unauthorized(with: authorization)]
        }
        
        if case .edit = route {
            return [.profile, route]
        }
        
        return [route]
    }
    
    func navigationAuthorization(route: ProfileRoute) -> RouteAuthorizationStatus {
        .authorized
    }
}
