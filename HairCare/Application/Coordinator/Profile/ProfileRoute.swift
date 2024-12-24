//
//  ProfileRoute.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 24/12/24.
//


enum ProfileRoute: RouteProtocol {
    case profile
    case edit
    case unauthorized(with: RouteAuthorizationStatus)
}
