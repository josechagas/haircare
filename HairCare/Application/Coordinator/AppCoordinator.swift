//
//  AppCoordinator.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 01/12/22.
//

import Foundation
import SwiftUI

class AppCoordinator: Coordinator {
    static let shared: AppCoordinator = AppCoordinator()
    
    private init(){}
    
    func pageFor(route: AppRoute) -> some View {
        switch route {
        case .start:
            StartPageBuilder().build()
        case AppRoute.home:
            HomeBuilder().build()
        case AppRoute.productDetail(let product):
            ProductDetailBuilder(product: product).build()
        case .packDetail:
            EmptyView()
        }
    }
}

enum AppRoute: Codable, Hashable {
    case start
    case home
    case productDetail(product: Product)
    case packDetail(pack: Pack)
    
    static func == (lhs: AppRoute, rhs: AppRoute) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
        
    func hash(into hasher: inout Hasher) {
        do {
            let result: Data = try JSONEncoder().encode(self)
            hasher.combine(result.hashValue)
        } catch {
            hasher.combine(UUID().hashValue)
        }
    }
}
