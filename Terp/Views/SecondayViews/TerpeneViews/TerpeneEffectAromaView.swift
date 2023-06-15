//
//  TerpeneEffectAromaView.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct TerpeneEffectAromaView: View {
    let effectAroma: EffectAromaJSON
//    let title: String
//    let description: String
//    var image: String?
    var body: some View {
        ScrollView(.vertical){
            VStack{
                
                TerpeneEffectAromaHeaderRow(effectAroma: self.effectAroma)
                TerpeneEffectAromaTerpeneRow(effectAroma: self.effectAroma)
                TerpeneEffectAromaStrainRow(effectAroma: self.effectAroma)
                
            }.padding()
        }
    }
}

struct TerpeneEffectAromaView_Previewsj: PreviewProvider {
    static var previews: some View {
        TerpeneEffectAromaView(effectAroma: EffectAromaJSON.example)
    }
}
