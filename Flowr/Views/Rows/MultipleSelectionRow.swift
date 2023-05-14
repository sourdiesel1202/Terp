//
//  MultipleSelectionRow.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var description: String?
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            
//            self.isSelected = self.isSelected==true
            HStack{
                VStack (alignment: .leading){
                    Text(self.title).font(.headline)
                    if description != nil{
                        Text(self.description!).font(.subheadline)
                    }
                }
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
                
            }
        }.foregroundColor(.black)
    }
}
struct MultipleSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionRow(title: "Fuck",description: "A duck", isSelected: true, action: {})
    }
}
