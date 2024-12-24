//
//  ProfileCoordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 23/12/24.
//

import SwiftUI

struct ProfileCoordinator: Coordinator {
    let children: [any Coordinator] = []
    
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
    
    func navigationAuthorization(route: ProfileRoute) -> RouteAuthorizationStatus {
        .authorized
    }
}
