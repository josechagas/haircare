//
//  RouteAuthorizationStatus.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 23/12/24.
//

enum RouteAuthorizationStatus: AuthorizationProtocol {
    case authorized
    case denied
    case unknownRoute
    
    func isAuthorized() -> Bool {
        self == .authorized
    }
}
