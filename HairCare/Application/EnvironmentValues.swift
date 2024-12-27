//
//  EnvironmentValues.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 26/12/24.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var navigationDelegate: (any NavigationDelegate<AppRoute>)? = nil
}
