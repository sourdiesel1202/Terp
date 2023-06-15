//
//  TerpeneEffectAromaView.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct TerpeneEffectAromaView: View {
    let effectAroma: AromaEffectJSON
//    let title: String
//    let description: String
//    var image: String?
    var body: some View {
        VStack{
            
            URLImage(url: self.effectAroma.image, shape: AnyShape(Rectangle())).scaledToFit()
            Text(self.effectAroma.name).font(.title).fontWeight(.bold).padding(.bottom)
            Text(self.effectAroma.description).font(.headline)
            
        }
    }
}

struct TerpeneEffectAromaView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneEffectAromaView(effectAroma: AromaEffectJSON.example)
    }
}
