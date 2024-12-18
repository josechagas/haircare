//
//  ViewWithViewModel.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/08/22.
//

import SwiftUI
import Combine

protocol ViewWithViewModel: View {
    associatedtype T where T: ViewModelProtocol
    @StateObject var viewModel: T {get}
}
