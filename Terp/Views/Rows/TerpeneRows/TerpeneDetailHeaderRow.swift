//
//  TerpeneDetailHeaderRow.swift
//  Flowr
//
//  Created by Andrew on 5/25/23.
//

import SwiftUI

struct TerpeneDetailHeaderRow: View {
    let terpene: TerpeneJSON
    var body: some View {
        
        VStack(alignment: .center){
            Text(terpene.name).font(.title).padding(.bottom)
            Image(systemName: "atom").resizable()
                .aspectRatio(contentMode: .fit).scaledToFit()
            //            } else{
            //                URLImage(url: terpene.image, shape: AnyShape(Circle()))
            //            }
            //            Image(systemName: "atom").padding()
            
            Text(terpene.description).padding()
        }
    }
}

struct TerpeneDetailHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneDetailHeaderRow(terpene: TerpeneJSON.example)
    }
}
