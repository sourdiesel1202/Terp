//
//  TerpeneDetailStrainRow.swift
//  Flowr
//
//  Created by Andrew on 5/25/23.
//

import SwiftUI
import CoreData
struct TerpeneDetailStrainRow: View {
    let terpene: TerpeneJSON
    @State private var loading: Bool = true
    @State private var strains: [StrainJSON] = [StrainJSON]()
//    private var strains: [StrainJSON]{
//        return StrainJSONUtil.loadStrainsByTerpene(terpene: self.terpene)
//    }
    var body: some View {
            
        VStack{
            Text("Strains  Containing \(self.terpene.name)").font(.title).fontWeight(.bold).padding([.bottom])
            RowHeaderViewAll(text: "Strains (\(self.strains.count))", data: StrainJSONUtil.loadStrainDataMap(strains: self.strains))
            if loading{
                ProgressView()
            }else{
                
                HorizontalStrainListRow(strains: self.strains)
            }
        }.onAppear{
            DispatchQueue.global(qos: .utility).async {
                let viewContext: NSManagedObjectContext = {
//                    let newbackgroundContext = PersistenceController.shared.container.newBackgroundContext()
                    let newbackgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                    newbackgroundContext.parent = PersistenceController.shared.container.viewContext
                    newbackgroundContext.automaticallyMergesChangesFromParent = true
                    return newbackgroundContext
                }()
                let _strains = StrainJSONUtil.loadStrainsByTerpene(terpene: self.terpene, viewContext: viewContext)
                DispatchQueue.main.async {
                    self.strains = _strains
                    self.loading = false
                }
        }
        }
    }
}

struct TerpeneDetailStrainRow_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneDetailStrainRow(terpene: TerpeneJSON.example)
    }
}
