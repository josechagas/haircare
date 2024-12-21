//
//  AppCoordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 01/12/22.
//

import Foundation
import SwiftUI

final class AppCoordinator: Coordinator, ObservableObject {
    @Published var navigationPath: NavigationPath = NavigationPath()

    func pageFor(route: AppRoute) -> some View {
        switch route {
        case .start:
            StartPageBuilder().build()
        case AppRoute.home:
            HomeBuilder().build()
        case AppRoute.productDetail(let product):
            ProductDetailBuilder(product: product).build()
        case .unauthorized:
            VStack(alignment: .center){
                Spacer()
                Text("Sem permissão")
                Spacer()
            }
        case .packDetail:
            EmptyView()
        }
    }
    
    func navigationAuthorization(route: AppRoute) -> RouteAuthorizationStatus {
        .authorized
    }
}

enum AppRoute: RouteProtocol {
    case start
    case home
    case productDetail(product: Product)
    case packDetail(pack: Pack)
    case unauthorized(with: RouteAuthorizationStatus)
    
    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
        
    func hash(into hasher: inout Hasher) {
        let describing = String(describing: self)
        hasher.combine(describing.hashValue)
    }
}

enum RouteAuthorizationStatus: AuthorizationProtocol {
    case authorized
    case denied
    
    func isAuthorized() -> Bool {
        self == .authorized
    }
}
