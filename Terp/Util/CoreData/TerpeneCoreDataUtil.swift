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
        return viewContext.performAndWait {
            
            
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
    }
    static func loadTerpenes(viewContext: NSManagedObjectContext)->[Terpene]{
        return viewContext.performAndWait {
            let fetchRequest = NSFetchRequest<Terpene>(entityName: "Terpene")
            //        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
            do{
                let terpenes = try viewContext.fetch(fetchRequest)
                return terpenes
            }catch let error as NSError{
                print("Could not load Terpenes \(error.userInfo)")
            }
            return [Terpene]()
        }
        
    }
    static func loadEffects(viewContext: NSManagedObjectContext)->[Effect]{
        return viewContext.performAndWait {
            let fetchRequest = NSFetchRequest<Effect>(entityName: "Effect")
            //        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
            do{
                let effects = try viewContext.fetch(fetchRequest)
                return effects
            }catch let error as NSError{
                print("Could not load effects \(error.userInfo), \(error.localizedDescription)")
            }
            return [Effect]()
        }
    }
    
    static func loadAromaByName(name: String, viewContext: NSManagedObjectContext) throws -> Aroma {
        return try viewContext.performAndWait {
            let fetchRequest = NSFetchRequest<Aroma>(entityName: "Aroma")
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do{
                let effects = try viewContext.fetch(fetchRequest)
                if effects.count > 0 {
                    return effects.first!
                    
                }else{
                    throw TerpeneError.aromaNotFound
                }
                
                
            }catch let error as NSError{
                print("Could not load aroma: \(name) \(error.userInfo)")
            }
            
            throw TerpeneError.aromaNotFound
        }
//        }
    }
    static func loadTerpeneByName(name: String, viewContext: NSManagedObjectContext) throws -> Terpene {
        return try viewContext.performAndWait {
            let fetchRequest = NSFetchRequest<Terpene>(entityName: "Terpene")
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do{
                let effects = try viewContext.fetch(fetchRequest)
                if effects.count > 0 {
                    return effects.first!
                    
                }else{
                    throw TerpeneError.terpeneNotFound
                }
                
                
            }catch let error as NSError{
                print("Could not load aroma: \(name) \(error.userInfo)")
            }
            throw TerpeneError.aromaNotFound
        }
//        }
    }
    static func loadEffectByName(name: String, viewContext: NSManagedObjectContext) throws -> Effect {
        return try  viewContext.performAndWait {
            let fetchRequest = NSFetchRequest<Effect>(entityName: "Effect")
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do{
                let effects = try viewContext.fetch(fetchRequest)
                if effects.count > 0 {
                    return effects.first!
                    
                }else{
                    throw TerpeneError.effectNotFound
                }
                
                
            }catch let error as NSError{
                print("Could not load effect \(name) from core data \(error.userInfo) \(error.localizedDescription)")
            }
            throw TerpeneError.effectNotFound
        }
//        }
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
        
        if self.loadEffects(viewContext: viewContext).count == 0 {
            print("No effects have been loaded, loading effects")
            TerpeneJSONUtil.loadEffectJSON(viewContext: viewContext).forEach { effect in
                do{
                    _ = try self.loadEffectByName(name: effect.name, viewContext: viewContext)
                }catch{
                    let _effect = Effect(context: viewContext)
                    //                _effect.desc
                    _effect.name = effect.name
                    _effect.desc = effect.description
                    _effect.id = effect.id
                    _effect.image = effect.image
                    //                privateContext.perform {
                    
                    //                    do {
                    
                    //                        try privateContext.save()
                    viewContext.performAndWait {
                        do{
                            try viewContext.save()
                            print("Wrote effect \(effect.name)")
                        } catch{
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    }
                }
            }
            
        }
    }
    static func searchTerpenesByName(name: String,viewContext: NSManagedObjectContext)->[Terpene] {
//        let viewContext: NSManagedObjectContext = {
//            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//            moc.parent = PersistenceController.shared.container.viewContext
//            return moc
//        }()
        let fetchRequest = NSFetchRequest<Terpene>(entityName: "Terpene")
        fetchRequest.predicate = NSPredicate(format: "name contains[cd] %@", name.lowercased())
        do{
            let strains = try viewContext.fetch(fetchRequest)
            return strains
        }catch let error as NSError{
            print("Could not search for strains by keyword \(name) \(error.userInfo)")
        }
        return [Terpene]()
    }
    
    static func searchEffectsByName(name: String, viewContext: NSManagedObjectContext)->[Effect] {
//        let viewContext: NSManagedObjectContext = {
//            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//            moc.parent = PersistenceController.shared.container.viewContext
//            return moc
//        }()
        let fetchRequest = NSFetchRequest<Effect>(entityName: "Effect")
        fetchRequest.predicate = NSPredicate(format: "name contains[cd] %@", name.lowercased())
        do{
            let strains = try viewContext.fetch(fetchRequest)
            return strains
        }catch let error as NSError{
            print("Could not search for strains by keyword \(name) \(error.userInfo)")
        }
        return [Effect]()
    }
    static func searchAromasByName(name: String,viewContext: NSManagedObjectContext)->[Aroma] {
//        let viewContext: NSManagedObjectContext = {
//            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//            moc.parent = PersistenceController.shared.container.viewContext
//            return moc
//        }()
        let fetchRequest = NSFetchRequest<Aroma>(entityName: "Aroma")
        fetchRequest.predicate = NSPredicate(format: "name contains[cd] %@", name.lowercased())
        do{
            let strains = try viewContext.fetch(fetchRequest)
            return strains
        }catch let error as NSError{
            print("Could not search for strains by keyword \(name) \(error.userInfo)")
        }
        return [Aroma]()
    }
    
    static func buildAromaCoreData(viewContext: NSManagedObjectContext){
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
        
        viewContext.performAndWait {
            if self.loadAromas(viewContext: viewContext).count == 0 {
                
                print("No aromas have been loaded, loading aromas")
                TerpeneJSONUtil.loadAromaJSON(viewContext: viewContext).forEach { aroma in
                    do {
                        _ = try self.loadAromaByName(name: aroma.name, viewContext: viewContext)
                    }catch{
                        let _aroma = Aroma(context: viewContext)
                        _aroma.name = aroma.name
                        _aroma.desc = aroma.description
                        _aroma.id = aroma.id
                        _aroma.image = aroma.image
                        //                privateContext.perform {
                        
                        //                    do {
                        
                        //                        try privateContext.save()
                        //                            viewContext.performAndWait {
                        do{
                            try viewContext.save()
                            print("Wrote aroma \(aroma.name)")
                        } catch{
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    }
                }
            }
        }
    }
    
    
//    static 
    static func buildTerpeneCoreData(viewContext: NSManagedObjectContext){
        //load data in here
        viewContext.performAndWait {
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
            
            TerpeneJSONUtil.loadTerpenes(viewContext: viewContext).forEach(){ terpene in
                do{
                    _ = try self.loadTerpeneByName(name: terpene.name, viewContext: viewContext)
                }catch{
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
                        _terpene.addToAromas(aromas.filter({$0.name!.lowercased() == _aroma.name.lowercased() }).first!)
                        //                    }
                        
                    }
                    terpene.effects.forEach(){ _effect in
                        _terpene.addToEffects(effects.filter({$0.name!.lowercased() == _effect.name.lowercased() }).first!)
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
    }
}
