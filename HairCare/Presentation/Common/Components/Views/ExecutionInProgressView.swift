//
//  ExecutionInProgressView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 12/08/22.
//

import SwiftUI

struct ExecutionInProgressView: View {
    var body: some View {
        VStack(spacing: 20) {
            ProgressView()
            Text(
                "Loading products"
            )
            .font(.title2)
        }
        .transition(.opacity)
    }
}

struct ExecutionInProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ExecutionInProgressView()
    }
}
