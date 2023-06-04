//
//  FullWidthText.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct FullWidthText: View {
    let text: String
    var body: some View {
        Text(self.text).frame(maxWidth: .infinity).font(.headline).fontWeight(.bold).padding().background(.blue)
            .foregroundColor(.white)
            .clipShape(
                
                // 2
                Capsule()
            ).padding([.leading, .trailing])
    }
}

struct FullWidthText_Previews: PreviewProvider {
    static var previews: some View {
        FullWidthText(text: "Fuck")
    }
}
