//
//  StrainRateDescriptionRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct StrainRateDescriptionRow: View {
    @State var text: Binding<String>
    var body: some View {
        VStack(alignment: .leading){
            RowHeader(text: "Notes")
            TextField("Description",text: self.text, axis: .vertical ) .textFieldStyle(.roundedBorder)
                .lineLimit(3...).padding([.leading,.trailing])
        }
        
    }
}

struct StrainRateDescriptionRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainRateDescriptionRow(text: .constant("My notes about a strain"))
    }
}
