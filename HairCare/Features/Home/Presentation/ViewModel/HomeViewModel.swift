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
        
    private let packsUseCase: FetchPacksUseCaseProtocol
    private let productsByCategoryUseCase: FetchProductsByCategoryUseCaseProtocol
    
    init(packsUseCase: FetchPacksUseCaseProtocol,
         productsByCategoryUseCase: FetchProductsByCategoryUseCaseProtocol) {
        self.packsUseCase = packsUseCase
        self.productsByCategoryUseCase = productsByCategoryUseCase
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
        async let loadedProducts = productsByCategoryUseCase.execute()
        async let loadedPacks = packsUseCase.execute()
        (productsByCategory, packs) = try await (loadedProducts, loadedPacks)
    }
}
