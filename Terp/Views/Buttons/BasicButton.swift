//
//  BasicButton.swift
//  Flowr
//
//  Created by Andrew on 5/16/23.
//

import SwiftUI

struct BasicButton: View {
    let text: String
    var font: Font?
    var action: ()-> Void?
    var body: some View {
        Button(action:{}){
            Text(self.text).font(self.font == nil ? .subheadline: self.font).fontWeight(.bold).padding(10).cornerRadius(15).background(.blue).cornerRadius(15)
                .foregroundColor(.white)
                .clipShape(
                    
                    // 2
                    Capsule()
                )
        }
    }
}

struct BasicButton_Previews: PreviewProvider {
    static var previews: some View {
        BasicButton(text: "A Button", action: {})
    }
}
