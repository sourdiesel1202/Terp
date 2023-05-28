//
//  StrainRateConsumptionRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct StrainRateConsumptionRow: View {
    let selectedOption: Binding<ConsumptionType>// = .flower
//    let strain: Strain
    var body: some View {
        VStack{
            RowHeader(text: "How did you partake?").padding([.top])
            Picker("Consumption", selection: selectedOption) {
                // 1
                ForEach(ConsumptionType.allCases) { option in
                    
                    // 2
                    Text(String(describing: option))
                    
                }
            }
            .pickerStyle(.wheel).padding([.leading,.trailing])
        }
    }
}

struct StrainRateConsumptionRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainRateConsumptionRow(selectedOption: .constant(.flower))
    }
}
