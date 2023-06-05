//
//  TerpeneCoreDataUtil.swift
//  Terp
//
//  Created by Andrew on 6/5/23.
//
import CoreData
import Foundation
struct TerpeneCoreDataUtil{
    static func loadAromas(viewContext: NSManagedObjectContext)->[Aroma]{
        let fetchRequest = NSFetchRequest<Aroma>(entityName: "Aroma")
//        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
        do{
            let aromas = try viewContext.fetch(fetchRequest)
            return aromas
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return [Aroma]()
    }
    static func loadTerpenes(viewContext: NSManagedObjectContext)->[Terpene]{
        let fetchRequest = NSFetchRequest<Terpene>(entityName: "Terpene")
//        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
        do{
            let terpenes = try viewContext.fetch(fetchRequest)
            return terpenes
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return [Terpene]()
    }
    static func loadEffects(viewContext: NSManagedObjectContext)->[Effect]{
        let fetchRequest = NSFetchRequest<Effect>(entityName: "Effect")
//        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
        do{
            let effects = try viewContext.fetch(fetchRequest)
            return effects
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return [Effect]()
    }
    
    static func deleteTerepenes(viewContext: NSManagedObjectContext){
        let terpenes = self.loadTerpenes(viewContext: viewContext)
        print("Terpene count: \(terpenes.count)")
        terpenes.forEach(){terpene in
            viewContext.delete(terpene)
            
        }
        
        do{
            try viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Terpene Count: \(self.loadTerpenes(viewContext: viewContext).count)")

    }
    
    static func deleteEffects(viewContext: NSManagedObjectContext){
        let effects = self.loadEffects(viewContext: viewContext)
        print("Effect count: \(effects.count)")
        effects.forEach(){effect in
            viewContext.delete(effect)
            
        }
        
        do{
            try viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Effect Count: \(self.loadEffects(viewContext: viewContext).count)")

    }
    static func deleteAromas(viewContext: NSManagedObjectContext){
        let aromas = self.loadAromas(viewContext: viewContext)
        print("Aroma count: \(aromas.count)")
        aromas.forEach(){aroma in
            viewContext.delete(aroma)
            
        }
        
        do{
            try viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Aroma Count: \(self.loadAromas(viewContext: viewContext).count)")

    }
    
    
    static func buildEffectCoreData(viewContext: NSManagedObjectContext){
//        @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
        
        if self.loadEffects(viewContext: viewContext).count == 0 {
            print("No effects have been loaded, loading effects")
            TerpeneJSONUtil.loadEffects().forEach { effectStr in
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
    
    
    static func buildAromaCoreData(viewContext: NSManagedObjectContext){
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
        
        if self.loadAromas(viewContext: viewContext).count == 0 {
            print("No aromas have been loaded, loading aromas")
            TerpeneJSONUtil.loadAromas().forEach { aromaStr in
                let _aroma = Aroma(context: viewContext)
                _aroma.name = aromaStr
                _aroma.desc = DictionaryUtil.loadDescription(text: aromaStr)
                _aroma.id = String(Int.random(in: 1000...5000))
//                privateContext.perform {
                    
//                    do {
                        
//                        try privateContext.save()
//                            viewContext.performAndWait {
                                do{
                                    try viewContext.save()
                                    print("Wrote aroma \(aromaStr)")
                                } catch{
                                    let nsError = error as NSError
                                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                                }
            }
        }

    }
    
    
    
    static func buildTerpeneCoreData(viewContext: NSManagedObjectContext){
        //load data in here
        
        if self.loadTerpenes(viewContext: viewContext).count == 0 {
            //we will need to load terpene data in
            print("Terpene count is zero, we need to load terpene data")
            //            @FetchRequest(sortDescriptors: []) var effects: FetchedResults<Effect>
            //            @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
            //ok so now that we've built the aromas and effects, so now we build terpenes
            let aromas = self.loadAromas(viewContext: viewContext)
            let effects = self.loadEffects(viewContext: viewContext)
            print("Aroma count: \(aromas.count)")
            print("Effect count: \(effects.count)")
            
            TerpeneJSONUtil.loadTerpenes().forEach(){ terpene in
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
