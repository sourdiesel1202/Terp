//
//  HorizontalTerpeneRow.swift
//  Flowr
//
//  Created by Andrew on 5/25/23.
//

import SwiftUI

struct HorizontalTerpeneRow: View {
    let terpenes: [TerpeneJSON]
    private var limit: Int {
        return self.terpenes.count > 3 ? 3: self.terpenes.count
    }
    var body: some View {
                    ScrollView(.horizontal){
                        HStack(alignment: .top){
                            ForEach(self.terpenes[0..<self.limit], id: \.self){ (terpene:TerpeneJSON) in
//                            ForEach(terpenes, id: \.self){ (terpene: TerpeneJSON) in
                                NavigationLink{
                                    TerpeneDetailView(terpene: terpene)
                                } label: {
                                    VStack{
                                        CircleText(text: terpene.name, color: .blue)
                                        Text(terpene.name).font(.caption).fontWeight(.bold)
        
                                    }
                                }.padding([.leading,.trailing])
                            }
                            if self.terpenes.count > 3{
                                Button(action: {}){
                                    NavigationLink{
                                        ThumbnailListView(data: TerpeneJSONUtil.loadTerpeneDataMap(terpenes: self.terpenes), searchTitle: "Terpenes (\(self.terpenes.count))")
                                    }label: {
                                        VStack{
                                            Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.blue)
                                            Text("View All").font(.caption2).fontWeight(.bold)
                                            
                                        }
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
