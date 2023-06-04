//
//  StrainDetailSourcesRow.swift
//  Flowr
//
//  Created by Andrew on 6/1/23.
//

import SwiftUI

struct StrainDetailSourcesRow: View {
    let strain: Strain
    @Environment(\.openURL) var openURL
    var body: some View {
//        RowHeader(text: "Sources")
//        ScrollView(.horizontal){
            VStack{
                Text("Sources").padding([.top,]).fontWeight(.bold)
                Text("Places we've pulled information about \(self.strain.name)").padding([.bottom]).font(.subheadline)//.fontWeight(.bold)
                
                RowHeader(text: "Found on 1 site(s)")
//                CircleText(text: self.strain.url, color: .blue, letterLimit: 1)
                ScrollView(.horizontal){
                    Button(action: {
                        openURL(URL(string: self.strain.url)!)
                    }){
                    VStack{
                        
                            CircleText(text: self.strain.url.components(separatedBy: "/")[2].components(separatedBy: ".")[1].uppercased(), color: .blue, letterLimit: 1)
                            Text("\(self.strain.url.components(separatedBy: "/")[2].components(separatedBy: ".")[1].uppercased())").font(.caption)
                            
                        }
                    }
                }.padding([.leading,.trailing])
            }
            //here is where we will need to convert this
            
//        }
    }
}

struct StrainDetailSourcesRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailSourcesRow(strain: Strain.example)
    }
}
