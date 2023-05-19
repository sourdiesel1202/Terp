//
//  TerpeneEffectAromaView.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct TerpeneEffectAromaView: View {
    let title: String
    let description: String
    var image: String?
    var body: some View {
        VStack{
            
            if self.image == nil{
                Image(systemName: "atom").resizable().scaledToFit().clipped().frame(width: 200, height: 200)
            }else{
                URLImage(url: self.image!, shape: AnyShape(Circle()))
            }
//            Image(systemName: "atom").resizable().scaledToFit().clipped().frame(width: 200, height: 200)
            Text(self.title).font(.title).fontWeight(.bold)
            Text(self.description).font(.headline)
            
        }
    }
}

struct TerpeneEffectAromaView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneEffectAromaView(title: "Apples", description: "Are you hungry for apples??")
    }
}
