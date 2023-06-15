//
//  StrainDetailProfileRow.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct StrainDetailTerpeneProfileRow: View {
    let strain: StrainJSON
    @State private var aromas: [EffectAromaJSON] = [EffectAromaJSON]()
    @State private var effects: [EffectAromaJSON] = [EffectAromaJSON]()
    @State private var terpenes: [TerpeneJSON] = [TerpeneJSON]()
    @State private var loading: Bool = false
    @EnvironmentObject var errorHandler: ErrorHandler
    var body: some View {
        Text("Terpene Profile").padding([.top,.bottom]).fontWeight(.bold)
        VStack{
            
            
            if self.loading{
                RowHeader(text: "Terpenes")
                ProgressView()
            }else{
//                RowHeaderViewAll(text: "Terpenes", data: TerpeneJSONUtil.loadTerpeneDataMap(terpenes: self.terpenes))
                HorizontalTerpeneRow(terpenes: self.terpenes)
            }
            //            ViewDivider(height: 0.25)
            ViewDivider(height: 0.5)
            
            if self.loading{
                RowHeader(text: "Aromas")
                ProgressView()
            }else{
                RowHeaderViewAll(text: "Aromas", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.aromas))
                HorizontalTerpeneEffectAromaRow(data: self.aromas)
            }
            
            ViewDivider(height: 0.5)
            
            if self.loading{
                RowHeader(text: "Effects")
                ProgressView()
            }else{
                RowHeaderViewAll(text: "Effects", data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.effects))
                HorizontalTerpeneEffectAromaRow(data: self.effects)
            }
            
            
        }.onAppear{
            self.loading = true
            DispatchQueue.global(qos: .utility).async {
                
                do{
                    let _terpenes = try TerpeneJSONUtil.loadTerpenesByName(names: self.strain.terpenes)
                    let _effects = try TerpeneJSONUtil.loadEffectsByNames(names: TerpeneJSONUtil.loadTerpeneEffects(terpenes: _terpenes))
                    let _aromas = try TerpeneJSONUtil.loadAromasByNames(names: TerpeneJSONUtil.loadTerpeneAromas(terpenes: _terpenes))
                    
                    //                        let strainData = try StrainJSONUtil.loadStrainsByNames(names: self.achievement.strains)
                    DispatchQueue.main.async {
                        self.aromas = _aromas
                        self.effects = _effects
                        self.terpenes = _terpenes
                        self.loading = false
                    }
                }catch{
                    DispatchQueue.main.async {
                        self.errorHandler.handle(error: error)
                        //                        self.loading = false
                        self.loading = false
                    }
                    
                }
                
                
            }
        }
        
    }
}

struct StrainDetailProfileRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailTerpeneProfileRow(strain: StrainJSON.example)
    }
}
