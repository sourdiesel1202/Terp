//
//  TerpeneEffectAromaTerpeneRow.swift
//  Terp
//
//  Created by Andrew on 6/15/23.
//

import SwiftUI
import CoreData

struct TerpeneEffectAromaTerpeneRow: View {
    let effectAroma: EffectAromaJSON
    @State private var terpenes: [TerpeneJSON] = [TerpeneJSON]()
    @State private var loading: Bool = true
    @EnvironmentObject var errorHandler: ErrorHandler
    var body: some View {
        VStack{
            Text("Present In These Terpenes").font(.title).fontWeight(.bold).padding([.top, .bottom])
            if self.loading{
                ProgressView()
            }else{
                RowHeaderViewAll(text: "Terpenes (\(self.terpenes.count))", data: TerpeneJSONUtil.loadTerpeneDataMap(terpenes: self.terpenes))
                HorizontalTerpeneRow(terpenes: self.terpenes)
            }
        }.onAppear{
            
            DispatchQueue.global(qos: .userInteractive).async {
                //                    let strainData = StrainJSONUtil.loadStrains()
                //                let _searchResults = loadSearchResults()
                
//                let parents = try StrainJSONUtil.loadStrainParents(strain: self.strain)
//                let children = try StrainJSONUtil.loadStrainChildren(strain: self.strain)
                let viewContext: NSManagedObjectContext = {
                    let newbackgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                    newbackgroundContext.parent = PersistenceController.shared.container.viewContext
                    newbackgroundContext.automaticallyMergesChangesFromParent = true
                    return newbackgroundContext
                }()

                let _terpenes = TerpeneJSONUtil.loadTerpenesByEffectAroma(effectAroma: self.effectAroma, viewContext: viewContext)
                DispatchQueue.main.async {
                    self.terpenes = _terpenes
                    self.loading = false
                }
                
            }
        

    }
    }
}

struct TerpeneEffectAromaTerpeneRow_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneEffectAromaTerpeneRow(effectAroma: EffectAromaJSON.example)
    }
}
