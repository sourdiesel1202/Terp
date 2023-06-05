//
//  MainTabView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI
import CoreData
struct MainTabView: View {
//    @EnvironmentObject var globalData: GlobalData
    @Environment(\.managedObjectContext) private var viewContext
//    @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
//    @FetchRequest(sortDescriptors: []) var effects: FetchedResults<Effect>
//    @FetchRequest(sortDescriptors: []) var terpenes: FetchedResults<Terpene>
    @State private var selectedTab = 1
    var body: some View {
        
        
           TabView {
               NavigationView{FeedView()}.tabItem{
                   Label("Feed", systemImage: "house.fill")
               }.tag(1)
               NavigationView{ProfileView(user: User.example)}.tabItem{
                   Label("Profile", systemImage: "person.fill")
               }.tag(2)
               NavigationView{StrainSearchView()}.tabItem {
                       Label("Strain Search", systemImage: "magnifyingglass.circle")
                   }.tag(3)
               
               NavigationView{DiscoverView()}.tabItem{
                   Label("Discover", systemImage: "globe.americas")
               }.tag(4)
               
               
               MoreView().tabItem{
                   Label("More", systemImage: "ellipsis")
               }.tag(5)
               

//               OrderView()
//                   .tabItem {
//                       Label("Order", systemImage: "square.and.pencil")
//                   }
           }.onAppear(perform: {
               //ok so here is where we need to load in our data into core data if it doesn't exist
               
               print("Clearing old data")
               self.deleteAromas()
               self.deleteEffects()
               self.deleteTerepenes()
               print("Loading data")
               self.buildAromaCoreData(viewContext: self.viewContext)
               self.buildEffectCoreData(viewContext: self.viewContext)
               self.buildTerpeneCoreData(viewContext: self.viewContext)
               
           })
       }
    private func loadAromas()->[Aroma]{
        let fetchRequest = NSFetchRequest<Aroma>(entityName: "Aroma")
//        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
        do{
            let aromas = try self.viewContext.fetch(fetchRequest)
            return aromas
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return [Aroma]()
    }
    private func loadTerpenes()->[Terpene]{
        let fetchRequest = NSFetchRequest<Terpene>(entityName: "Terpene")
//        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
        do{
            let terpenes = try self.viewContext.fetch(fetchRequest)
            return terpenes
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return [Terpene]()
    }
    private func loadEffects()->[Effect]{
        let fetchRequest = NSFetchRequest<Effect>(entityName: "Effect")
//        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
        do{
            let effects = try self.viewContext.fetch(fetchRequest)
            return effects
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return [Effect]()
    }
    private func deleteTerepenes(){
        let terpene = self.loadTerpenes()
        print("Terpene count: \(terpene.count)")
        self.loadTerpenes().forEach(){terpene in
            self.viewContext.delete(terpene)
            
        }
        
        do{
            try self.viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Aroma Count: \(self.loadAromas().count)")

    }
    
    private func deleteEffects(){
        let effects = self.loadEffects()
        print("Effect count: \(effects.count)")
        effects.forEach(){effect in
            self.viewContext.delete(effect)
            
        }
        
        do{
            try self.viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Effect Count: \(self.loadEffects().count)")

    }
    private func deleteAromas(){
        let aromas = self.loadAromas()
        print("Aroma count: \(aromas.count)")
        aromas.forEach(){aroma in
            self.viewContext.delete(aroma)
            
        }
        
        do{
            try self.viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Aroma Count: \(self.loadAromas().count)")

    }
    private func buildEffectCoreData(viewContext: NSManagedObjectContext){
//        @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
        
        if self.loadEffects().count == 0 {
            print("No effects have been loaded, loading effects")
            TerpeneUtil.loadEffects().forEach { effectStr in
                let _effect = Effect(context: viewContext)
                //                _effect.desc
                _effect.name = effectStr
                _effect.desc = DictionaryUtil.loadDescription(text: effectStr)
                _effect.id = String(Int.random(in: 1000...5000))
                //                privateContext.perform {
                
                //                    do {
                
                //                        try privateContext.save()
                viewContext.performAndWait {
                    do{
                        try viewContext.save()
                        print("Wrote effect \(effectStr)")
                    } catch{
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    //                        }
                    
                    //                    } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    //                        let nsError = error as NSError
                    //                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    //                    }
                    
                    //                }
                }
            }
            
        }
    }
    
    
    private func buildAromaCoreData(viewContext: NSManagedObjectContext){
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
        
        if self.loadAromas().count == 0 {
            print("No aromas have been loaded, loading aromas")
            TerpeneUtil.loadAromas().forEach { aromaStr in
                let _aroma = Aroma(context: viewContext)
                _aroma.name = aromaStr
                _aroma.desc = DictionaryUtil.loadDescription(text: aromaStr)
                _aroma.id = String(Int.random(in: 1000...5000))
//                privateContext.perform {
                    
//                    do {
                        
//                        try privateContext.save()
//                            viewContext.performAndWait {
                                do{
                                    try self.viewContext.save()
                                    print("Wrote aroma \(aromaStr)")
                                } catch{
                                    let nsError = error as NSError
                                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                                }
//                        }
                        
//                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                        let nsError = error as NSError
//                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//                    }
                    
//                }/
            }
        }

    }
    
    private func burnItDown(name: String){
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Terpene")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try PersistenceController.shared.container.persistentStoreCoordinator.execute(deleteRequest, with: self.viewContext)
        } catch let error as NSError {
            // TODO: handle the error
            print(error)
        }
    }
    
    private func buildTerpeneCoreData(viewContext: NSManagedObjectContext){
        //load data in here
        
        if self.loadTerpenes().count == 0 {
            //we will need to load terpene data in
            print("Terpene count is zero, we need to load terpene data")
//            @FetchRequest(sortDescriptors: []) var effects: FetchedResults<Effect>
//            @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
            //ok so now that we've built the aromas and effects, so now we build terpenes
            let aromas = self.loadAromas()
            let effects = self.loadEffects()
            print("Aroma count: \(aromas.count)")
            print("Effect count: \(effects.count)")
            
            TerpeneUtil.loadTerpenes().forEach(){ terpene in
                let _terpene = Terpene(context: viewContext)
                _terpene.id = String(Int.random(in: 1000...5000))
                _terpene.name = terpene.name
                _terpene.desc = terpene.description
                _terpene.image = terpene.image
                terpene.aromas.forEach(){ _aroma in
//                    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Aroma., ascending: true)]) var aromas: FetchedResults<Aroma>
//                    do{
//                        let request : NSFetchRequest <Aroma>
//                        let aroma = viewContext.fetch(<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>)
                        _terpene.addToAromas(aromas.filter({$0.name!.lowercased() == _aroma.lowercased() }).first!)
//                    }
                    
                }
                terpene.effects.forEach(){ _effect in
                    _terpene.addToEffects(effects.filter({$0.name!.lowercased() == _effect.lowercased() }).first!)
                }
                do {
                    try viewContext.save()
                    print("Wrote terpene \(terpene.name)")
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
                
                
            }

        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()//.environmentObject(GlobalData())
//            .environmentObject()
    }
}
