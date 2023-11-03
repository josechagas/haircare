//
//  HomeViewModel.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 01/08/22.
//

import Foundation
import Combine

class HomeViewModel: HomeViewModelProtocol {
    @Published var selectedTabIndex: Int = 0
    
    @Published var productsByCategory: [StoreItemCategory: [Product]]?
    @Published var packs: [Pack]?
    
    @Published var loadInformationsStatus: ExecutionStatus = .none
    @Published var refreshInformationsStatus: ExecutionStatus = .none
        
    private let viewStoreItemsUseCase: ViewStoreItemsUseCaseProtocol
    
    init(viewStoreItemsUseCase: ViewStoreItemsUseCaseProtocol) {
        self.viewStoreItemsUseCase = viewStoreItemsUseCase
    }
    
    func loadInformations() async {
        loadInformationsStatus = .inProgress
        do {
            try await performInformationsLoad()
            loadInformationsStatus = .success
        }
        catch {
            loadInformationsStatus = .failed
        }
    }
    
    func refreshInformations() async {
        refreshInformationsStatus = .inProgress
        do {
            try await performInformationsLoad()
            refreshInformationsStatus = .success
        }
        catch {
            refreshInformationsStatus = .failed
        }
    }
    
    private func performInformationsLoad() async throws {
        let usecase = viewStoreItemsUseCase
        async let loadedProducts = usecase.loadProductsByCategory()
        async let loadedPacks = usecase.loadPacks()
        (productsByCategory, packs) = try await (loadedProducts, loadedPacks)
    }
    
}
