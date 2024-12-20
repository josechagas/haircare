//
//  StartViewModelProtocol.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 02/12/22.
//

import Foundation

@MainActor
protocol StartViewModelProtocol: ViewModel {
    var present:Bool {get set}
}
