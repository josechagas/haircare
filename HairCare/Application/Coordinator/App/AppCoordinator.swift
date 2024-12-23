//
//  AppCoordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 01/12/22.
//

import Foundation
import SwiftUI

struct AppCoordinator: Coordinator {
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
