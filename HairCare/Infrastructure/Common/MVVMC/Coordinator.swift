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
    associatedtype Route: Codable

    @ViewBuilder
    func pageFor(route: Route) -> Page
}
