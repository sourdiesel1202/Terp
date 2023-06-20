//
//  DiscoverRecommendedStrainsRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI
import CoreData
struct DiscoverRecommendedStrainsRow: View {
    @State private var loading: Bool = true
    @State private var strains: [StrainJSON] = [StrainJSON]()
    var body: some View {
        
        VStack{
            Text("Strain Recommendations Based On Your Terpene Profile").fontWeight(.bold).padding().font(.title).multilineTextAlignment(.center)
                .lineLimit(nil)
            if loading{
                ProgressView().padding()
            }else{
                RowHeaderViewAll(text: "Recommended Strains", data: StrainJSONUtil.loadStrainDataMap(strains: Array(self.strains[10...15])))
                //            Text("Recommened Strains")
                HorizontalStrainListRow(strains: Array(self.strains[0...5]))
                ViewDivider(height: 0.25)
                RowHeaderViewAll(text: "Strains with Earthy aromas", data: StrainJSONUtil.loadStrainDataMap(strains: Array(self.strains[10...15])))
                HorizontalStrainListRow(strains: Array(self.strains[10...15]))
                ViewDivider(height: 0.25)
                RowHeaderViewAll(text: "Strains with Sedative effects", data: StrainJSONUtil.loadStrainDataMap(strains: Array(self.strains[10...15])))
                HorizontalStrainListRow(strains: Array(self.strains[4...9]))
                NavigationLink{
                    ThumbnailListView(data: StrainJSONUtil.loadStrainDataMap(strains: StrainJSONUtil.loadStrains(viewContext: PersistenceController.shared.container.viewContext)), searchTitle: "All Strains")
                }label: {
                    FullWidthText(text: "View All Strains").padding()
                }
            }
        }.onAppear {
            //            await self.loadstrainRecommendations()
            DispatchQueue.global(qos: .userInitiated).async {
                let viewContext: NSManagedObjectContext = {
                    let newbackgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                    newbackgroundContext.parent = PersistenceController.shared.container.viewContext
                    newbackgroundContext.automaticallyMergesChangesFromParent = true
                    return newbackgroundContext
                }()
                let strainData = StrainJSONUtil.loadStrains(viewContext: viewContext)
                DispatchQueue.main.async {
                    self.strains = strainData
                    self.loading = false
                }
            }
            
        }
    }
    
    
}

struct DiscoverRecommendedStrainsRow_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverRecommendedStrainsRow()
    }
}
