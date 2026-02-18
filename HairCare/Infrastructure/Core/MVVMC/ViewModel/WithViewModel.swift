//
//  Page.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 22/08/22.
//

import Foundation
import SwiftUI

@MainActor
protocol WithViewModel {
    associatedtype VModel: ViewModel
    var viewModel: Self.VModel {get}
}
