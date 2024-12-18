//
//  HomePageNavigationPath.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/12/22.
//

import SwiftUI

struct HomePageNavigationPath<Content>: View where Content: View {
    
    @State var navigationPath: NavigationPath = NavigationPath()
    let content: ()-> Content
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            content()
                .navigationDestination(for: AppRoute.self) { route in
                    AppCoordinator.shared.pageFor(route: route)
                }
        }
    }
}

struct HomePageNavigationPath_Previews: PreviewProvider {
    static var previews: some View {
        HomePageNavigationPath {
            EmptyView()
        }
    }
}
