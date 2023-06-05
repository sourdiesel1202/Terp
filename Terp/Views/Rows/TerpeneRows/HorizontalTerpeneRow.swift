//
//  HorizontalTerpeneRow.swift
//  Flowr
//
//  Created by Andrew on 5/25/23.
//

import SwiftUI

struct HorizontalTerpeneRow: View {
    let terpenes: [TerpeneJSON]
    var body: some View {
                    ScrollView(.horizontal){
                        HStack(alignment: .top){
                            ForEach(terpenes, id: \.self){ (terpene: TerpeneJSON) in
                                NavigationLink{
                                    TerpeneDetailView(terpene: terpene)
                                } label: {
                                    VStack{
                                        CircleText(text: terpene.name, color: .blue)
                                        Text(terpene.name).font(.caption).fontWeight(.bold)
        
                                    }
                                }.padding([.leading,.trailing])
                            }
        
                        }
                    }

    }
}

struct HorizontalTerpeneRow_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalTerpeneRow(terpenes: [TerpeneJSON.example])
    }
}
