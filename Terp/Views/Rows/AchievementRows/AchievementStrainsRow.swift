//
//  AchievementStrainsRow.swift
//  Terp
//
//  Created by Andrew on 6/13/23.
//

import SwiftUI
import CoreData
struct AchievementStrainsRow: View {
    let achievement: Achievement
    @State private var strains: [StrainJSON] = [StrainJSON]()
    @EnvironmentObject var errorHandler: ErrorHandler
    var body: some View {
        VStack{
            Text("Eligible Strains").font(.title).fontWeight(.bold)
            if self.achievement.strains[0] == "*"{
                Text("All")
//                /Text("Get Started Below").font(.caption)
                NavigationLink{
                    StrainSearchView()
                }label:{
                    FullWidthText(text: "Search Strains")
                }
            }else{
                RowHeaderViewAll(text: "Strains (\(self.achievement.strains.count))", data: StrainJSONUtil.loadStrainDataMap(strains: self.strains))
                if self.strains.count == 0{
                    ProgressView()
                }else{
                    HorizontalStrainListRow(strains: self.strains)
                }
                //
            }
            
        }.padding(.bottom).onAppear{
            if self.achievement.strains[0] != "*"{
                DispatchQueue.global(qos: .utility).async {
                    let viewContext: NSManagedObjectContext = {
                        let newbackgroundContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                        newbackgroundContext.parent = PersistenceController.shared.container.viewContext
                        newbackgroundContext.automaticallyMergesChangesFromParent = true
                        return newbackgroundContext
                    }(
                    )
                    do{
                        let strainData = try StrainJSONUtil.loadStrainsByNames(names: self.achievement.strains, viewContext: viewContext)
                        DispatchQueue.main.async {
                            self.strains = strainData
                            //                        self.loading = false
                        }
                    }catch{
                        DispatchQueue.main.async {
                            self.errorHandler.handle(error: error)
                            //                        self.loading = false
                        }
                        
                    }
                    
                }
            }
        }
    }
}

struct AchievementStrainsRow_Previews: PreviewProvider {
    static var previews: some View {
        AchievementStrainsRow(achievement: Achievement.example)
    }
}
