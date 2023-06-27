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
        HStack{
            Spacer()
        }
        VStack{
            Text("Create Review").font(.title).fontWeight(.bold)
        }
        VStack(alignment: .leading){
//            RowHeader(text: "Notes")
            
            TextField("What are your thoughts about this strain?",text: self.text, axis: .vertical )
                .lineLimit(3...).padding([.leading,.trailing]).frame(maxWidth: .infinity)
        }
        
    }
}

struct StrainRateDescriptionRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainRateDescriptionRow(text: .constant("My notes about a strain"))
    }
}
