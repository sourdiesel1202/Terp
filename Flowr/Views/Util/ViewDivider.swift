//
//  ViewDivider.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ViewDivider: View {
    var height: CGFloat
    var body: some View {
        Rectangle()
            .fill(.gray)
            .frame(height: self.height)
                    .edgesIgnoringSafeArea(.horizontal)
        
    }
}

struct ViewDivider_Previews: PreviewProvider {
    static var previews: some View {
        ViewDivider(height: 4)
    }
}
