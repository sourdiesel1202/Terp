//
//  StrainRateHeaderRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct StrainRateHeaderRow: View {
    let strain: StrainJSON
    var body: some View {
        VStack(alignment: .center){
            
            URLImage(url: strain.image, shape: AnyShape(Circle())).frame(width: 150, height: 150)
            Text(strain.name).fontWeight(.bold).font(.largeTitle).padding([.top, .bottom])
//            Toggle("Show welcome message", isOn: $showGreeting)
            
        }
    }
}

struct StrainRateHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainRateHeaderRow(strain: StrainJSON.example)
    }
}
