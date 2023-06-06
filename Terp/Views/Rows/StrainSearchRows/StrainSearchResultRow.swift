//
//  StrainSearchResultRow.swift
//  Flowr
//
//  Created by Andrew on 6/1/23.
//

import SwiftUI

struct StrainSearchResultRow: View {
    let strain: StrainJSON
    var body: some View {
        VStack(alignment: .leading){
        
            HStack{
                URLImage(url: strain.image, shape: AnyShape(Circle())).frame(width: 90, height: 90)
                Text(self.strain.name).font(.headline).fontWeight(.bold)
            }
            if self.strain.terpenes.count > 0{
                
                Text("Terpenes: \(self.strain.terpenes.joined(separator: ","))").fontWeight(.bold).font(.caption)
            }
            Text("Found on \(Array(strain.url.components(separatedBy: "/"))[2])").font(.caption).padding(.bottom)
            Text("\(String(self.strain.description.prefix(250))) ...").font(.caption)
            
        }.padding()
        
    }
}

struct StrainSearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainSearchResultRow(strain: StrainJSON.example)
    }
}
