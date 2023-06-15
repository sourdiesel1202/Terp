//
//  TerpeneEffectAromaStrainView.swift
//  Terp
//
//  Created by Andrew on 6/15/23.
//

import SwiftUI

struct TerpeneEffectAromaStrainRow: View {
    let effectAroma: EffectAromaJSON
    @State private var strains: [StrainJSON] = [StrainJSON]()
    @State private var loading: Bool = true
    @EnvironmentObject var errorHandler: ErrorHandler
    var body: some View {
        VStack{
            Text("Present In These Strains").font(.title).fontWeight(.bold).padding([.top, .bottom])
            if self.loading{
                ProgressView()
            }else{
                RowHeaderViewAll(text: "Strains (\(self.strains.count))", data: StrainJSONUtil.loadStrainDataMap(strains: self.strains))
                HorizontalStrainListRow(strains: self.strains)
            }
        }.onAppear{
            
            DispatchQueue.global(qos: .utility).async {
                var _strains = [StrainJSON]()
                TerpeneJSONUtil.loadTerpenesByEffectAroma(effectAroma: self.effectAroma).forEach({ terpene in
                    StrainJSONUtil.loadStrainsByTerpene(terpene: terpene).forEach({ strain in
                        _strains.append(strain)
                    })
//                    _strains.append(contentsOf: StrainJ)
                })
//                let _strains = StrainJSONUtil.loadStrainsByTerpene(terpene: )
                DispatchQueue.main.async {
                    self.strains = _strains
                    self.loading = false
                }
                
            }
        

    }
    }
}

struct TerpeneEffectAromaStrainView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneEffectAromaStrainRow(effectAroma: EffectAromaJSON.example)
    }
}
