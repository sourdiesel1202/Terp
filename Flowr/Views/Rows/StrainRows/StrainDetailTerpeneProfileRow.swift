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
        VStack(alignment: .leading){
            //            ViewDivider(height: 0.5)
            HStack{
                Text("Terpene Profile").padding([.leading,.bottom]).font(.subheadline).fontWeight(.bold)
            }
            HStack{
                Text("Terpenes (\(self.strain.terpenes.count))").padding([.leading,.bottom]).font(.caption)
                Spacer()
                NavigationLink{
                    ContentView()
                }label: {
                    Text("View All").font(.caption).padding([.bottom,.trailing])
                }
                
            }
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(self.strain.terpenes, id: \.self){ (terpene: String) in
                        NavigationLink{
                            TerpeneDetailView(terpene: TerpeneUtil.loadTerpeneByName(name: terpene))
                        } label: {
                            VStack{
                                CircleText(text: terpene, color: .blue)
                                Text(terpene).font(.caption).fontWeight(.bold)
                                
                            }
                        }.padding([.leading,.trailing])
                    }
                    
                }
            }
            
            //            ViewDivider(height: 0.25)
            ViewDivider(height: 0.5)
            HStack{
                Text("Aromas (\(StrainUtil.loadStrainAromas(strain: self.strain) .count))").padding([.leading,.bottom]).font(.caption)
                Spacer()
                NavigationLink{
                    ContentView()
                }label: {
                    Text("View All").font(.caption).padding([.bottom,.trailing])
                }
                
            }
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(StrainUtil.loadStrainAromas(strain: self.strain), id: \.self){ (aroma: String) in
                        NavigationLink{
                            TerpeneEffectAromaView(title: aroma, description: DictionaryUtil.loadDescription(text: aroma))
                            
                        } label: {
                            VStack{
                                CircleText(text: aroma, color: .blue)
                                Text(aroma).font(.caption).fontWeight(.bold)
                                
                            }
                        }.padding([.leading,.trailing])
                    }
                    
                }
            }
            ViewDivider(height: 0.5)
            //            ViewDivider(height: 0.25)
            Section{
                HStack{
                    Text("Effects (\(StrainUtil.loadStrainEffects(strain: self.strain).count))").padding([.leading,.bottom]).font(.caption)
                    Spacer()
                    NavigationLink{
                        ContentView()
                    }label: {
                        Text("View All").font(.caption).padding([.bottom,.trailing])
                    }
                    
                }
            }
            
            //                  ViewDivider(height: 0.12)
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(StrainUtil.loadStrainEffects(strain: self.strain), id: \.self){ (effect: String) in
                        NavigationLink{
                            TerpeneEffectAromaView(title: effect, description: DictionaryUtil.loadDescription(text: effect))
                            
                        } label: {
                            VStack{
                                CircleText(text: effect, color: .blue)
                                Text(effect).font(.caption).fontWeight(.bold)
                                
                            }
                        }.padding([.trailing])
                    }
                    
                }
                
            }.padding(.bottom)
        }
    }
}

struct StrainDetailProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailTerpeneProfileRow(strain: Strain.example)
    }
}
