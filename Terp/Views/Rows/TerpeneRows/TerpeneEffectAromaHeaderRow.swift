//
//  TerpeneEffectAromaHeaderRow.swift
//  Terp
//
//  Created by Andrew on 6/15/23.
//

import SwiftUI

struct TerpeneEffectAromaHeaderRow: View {
    let effectAroma: EffectAromaJSON
    var body: some View {
        URLImage(url: self.effectAroma.image, shape: AnyShape(Rectangle())).scaledToFit()
        Text(self.effectAroma.name).font(.title).fontWeight(.bold).padding(.top)
        Text(self.effectAroma.description).font(.headline)
    }
}

struct TerpeneEffectAromaHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneEffectAromaHeaderRow(effectAroma: EffectAromaJSON.example)
    }
}
