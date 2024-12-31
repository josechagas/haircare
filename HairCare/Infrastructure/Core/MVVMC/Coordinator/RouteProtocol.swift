//
//  RouteProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 29/12/24.
//

protocol RouteProtocol: Hashable, Identifiable<Int> {
    associatedtype Authorization: AuthorizationProtocol
    static func unauthorized(with: Authorization) -> Self
    var presentationStyle: PresentationStyle { get }
}

extension RouteProtocol {
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        let describing = String(describing: self)
        hasher.combine(describing.hashValue)
    }
    
    var id: Int {
        self.hashValue
    }
}

protocol AuthorizationProtocol {
    static var unknownRoute: Self { get }
    func isAuthorized() -> Bool
}

enum PresentationStyle {
    case stack
    case fullScreenCover
    case sheet
}
