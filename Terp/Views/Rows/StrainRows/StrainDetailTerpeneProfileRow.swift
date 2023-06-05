//
//  StrainDetailProfileRow.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct StrainDetailTerpeneProfileRow: View {
    let strain: Strain
    var body: some View {
        Text("Terpene Profile").padding([.top,.bottom]).fontWeight(.bold)
        VStack(alignment: .leading){
            //            ViewDivider(height: 0.5)
            
                
            
//            HStack{
//                Text("Terpenes (\(self.strain.terpenes.count))").padding([.leading,.bottom]).font(.caption)
//                Spacer()
//                NavigationLink{
//                    ContentView()
//                }label: {
//                    Text("View All").font(.caption).padding([.bottom,.trailing])
//                }
//
//            }
            RowHeaderViewAll(text: "Terpenes (\(self.strain.terpenes.count))", data: TerpeneJSONUtil.loadTerpeneDataMapFromStrings(terpenes:self.strain.terpenes))
            HorizontalTerpeneRow(terpenes: TerpeneJSONUtil.loadTerpenesByName(names: self.strain.terpenes))
//            ScrollView(.horizontal){
//                HStack(alignment: .top){
//                    ForEach(self.strain.terpenes, id: \.self){ (terpene: String) in
//                        NavigationLink{
//                            TerpeneDetailView(terpene: TerpeneUtil.loadTerpeneByName(name: terpene))
//                        } label: {
//                            VStack{
//                                CircleText(text: terpene, color: .blue)
//                                Text(terpene).font(.caption).fontWeight(.bold)
//
//                            }
//                        }.padding([.leading,.trailing])
//                    }
//
//                }
//            }
            
            //            ViewDivider(height: 0.25)
            ViewDivider(height: 0.5)
            RowHeaderViewAll(text: "Aromas (\(StrainUtil.loadStrainAromas(strain: self.strain) .count))", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: TerpeneJSONUtil.loadTerpeneAromas(terpenes: TerpeneJSONUtil.loadTerpenesByName(names: self.strain.terpenes))))
            HorizontalTerpeneEffectAromaRow(data: TerpeneJSONUtil.loadTerpeneAromas(terpenes: TerpeneJSONUtil.loadTerpenesByName(names: self.strain.terpenes)))
            
            ViewDivider(height: 0.5)
            RowHeaderViewAll(text: "Effects (\(StrainUtil.loadStrainEffects(strain: self.strain).count))", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: TerpeneJSONUtil.loadTerpeneEffects(terpenes: TerpeneJSONUtil.loadTerpenesByName(names: self.strain.terpenes))))
            HorizontalTerpeneEffectAromaRow(data: TerpeneJSONUtil.loadTerpeneEffects(terpenes: TerpeneJSONUtil.loadTerpenesByName(names: self.strain.terpenes)))
            
            
        }
    }
}

struct StrainDetailProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailTerpeneProfileRow(strain: Strain.example)
    }
}
