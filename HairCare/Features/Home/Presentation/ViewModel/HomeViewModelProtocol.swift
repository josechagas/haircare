//
//  HomeViewModelProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/08/22.
//

import Foundation
@MainActor
protocol HomeViewModelProtocol: ViewModel, HomeListViewModelProtocol {
    var loadInformationsStatus: ExecutionStatus {get}
    
    func loadInformations() async
}
@MainActor
protocol HomeListViewModelProtocol: ViewModel {
    var selectedTabIndex: Int {get set}
    
    var productsByCategory: [StoreItemCategory: [Product]]? {get}
    var packs: [Pack]? {get}
    
    var refreshInformationsStatus: ExecutionStatus {get}

    func refreshInformations() async
}
