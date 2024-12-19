//
//  UnitStepperView.swift
//  HairCare
//
//  Created by José Lucas Souza das Chagas on 30/06/22.
//

import SwiftUI

struct UnitStepperView: View {
    
    @Binding var units:Int
    
    private var minimum:Int = 0
    private var maximum: Int = .max
    
    init(units:Binding<Int>, minimum:Int = 0, maximum: Int = .max){
        _units = units
        self.minimum = minimum
        self.maximum = maximum
    }
    
    var body: some View {
        HStack {
            Button(action: {
                incrementBy(-1)
            }, label: {
                Image(systemName: "minus")
            })
                .disabled(units == minimum)
            Text("\(units)")
                .frame(minWidth: 35)
            Button(action: {
                incrementBy(1)
            }, label: {
                Image(systemName: "plus")
            })
                .disabled(units == maximum)
        }
        .padding([.leading, .trailing], 8)
        .padding([.top, .bottom], 5)
        .background {
            RoundedRectangle(cornerRadius: .infinity)
                .stroke(lineWidth: 0.5)
                .fill(Color.gray)
        }
    }
    
    private func incrementBy(_ value: Int) {
        units += value
    }
}

#Preview {
    UnitStepperView(
        units: .constant(1)
    )
}
