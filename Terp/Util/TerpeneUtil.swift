//
//  TerpeneUtil.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import Foundation
import SwiftUI
import CoreData

struct TerpeneUtil{
//    @Environment(\.managedObjectContext) private var viewContext
    
    static func loadTerpenes() -> [TerpeneJSON]  {
        return Bundle.main.decode([TerpeneJSON].self, from: "terpene.json")
        //    return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
    static func searchTerpenesByName(name: String) -> [TerpeneJSON]{
        return self.loadTerpenes().filter({$0.name.lowercased().contains(name.lowercased())})
    }
//    static func search
    static func loadTerpenesByAroma(aroma: String, terpenes: [TerpeneJSON]) -> [TerpeneJSON]{
        var _res = [TerpeneJSON]()
        terpenes.forEach { terpene in
            if !_res.contains(terpene) && terpene.aromas.contains(aroma){
                _res.append(terpene)
            }
        }
        return _res.sorted {
            $0.name < $1.name
        }
        
    }
    static func loadTerpeneByName(name: String, terpenes: [TerpeneJSON]) -> TerpeneJSON{
        return terpenes.filter({$0.name.lowercased()==name.lowercased()}).first!
        
    }
    static func loadTerpenesByName(names: [String]) -> [TerpeneJSON]{
        var _res = [TerpeneJSON]()
        let terpenes = self.loadTerpenes()
        names.forEach(){ name in
            if terpenes.contains(where: {$0.name.lowercased() == name.lowercased()}){
                _res.append(self.loadTerpeneByName(name: name))
            }
            
            
        }
        return _res
//        return self.loadTerpenes().filter(names.contains({$0.lowercased()==$1.name.lowercased()}))
        
    }
    static func loadTerpeneByName(name: String) -> TerpeneJSON{
        return self.loadTerpenes().filter({$0.name.lowercased()==name.lowercased()}).first!
        
    }

    static func loadTerpenesByEffect(effect: String, terpenes: [TerpeneJSON]) -> [TerpeneJSON]
    {
        var _res = [TerpeneJSON]()
        terpenes.forEach { terpene in
            if !_res.contains(terpene) && terpene.effects.contains(effect){
                _res.append(terpene)
            }
        }
        return _res.sorted {
            $0.name < $1.name
        }
    }
    
    static func loadAromas()->[String]{
        var _res = [String]()
        self.loadTerpenes().forEach { terpene in
            terpene.aromas.forEach { aroma in
                if !_res.contains(aroma){
                    _res.append(aroma)
                }
            }
        }
//        }
        return _res.sorted {
            $0 < $1
        }
    }
    
    static func loadEffects()->[String]{
        var _res = [String]()
        self.loadTerpenes().forEach { terpene in
            terpene.effects.forEach { effect in
                if !_res.contains(effect){
                    _res.append(effect)
                }
            }
        }
//        }
        return _res.sorted {
            $0 < $1
        }
    }
    
    static func loadTerpeneAromas(terpenes: [TerpeneJSON])->[String]{
        var _res = [String]()
        terpenes.forEach { terpene in
            terpene.aromas.forEach { aroma in
                if !_res.contains(aroma){
                    _res.append(aroma)
                }
            }
        }
//        }
        return _res.sorted {
            $0 < $1
        }
    }
    static func loadTerpeneAromas(terpenes: [TerpeneJSON])->[DataMap]{
        var _res = [DataMap]()
        loadTerpeneAromas(terpenes: terpenes).forEach { aroma in
//            terpene.effects.forEach { effect in
//                if !_res.contains(effect){
//                    _res.append(effect)
//                }
            _res.append(DataMap(key: aroma, value: "", view: ContentWithTitleDescView(title: aroma, desc: "", image: "atom")))
            }
        
//        }
        return _res.sorted {
            $0.key < $1.value
        }
    }
    
    static func loadTerpeneEffects(terpenes: [TerpeneJSON])->[String]{
        var _res = [String]()
        terpenes.forEach { terpene in
            terpene.effects.forEach { effect in
                if !_res.contains(effect){
                    _res.append(effect)
                }
            }
        }
//        }
        return _res.sorted {
            $0 < $1
        }
    }
    static func loadTerpeneEffects(terpenes: [TerpeneJSON])->[DataMap]{
        var _res = [DataMap]()
        loadTerpeneEffects(terpenes: terpenes).forEach { effect in
//            terpene.effects.forEach { effect in
//                if !_res.contains(effect){
//                    _res.append(effect)
//                }
            _res.append(DataMap(key: effect, value: "", view: ContentWithTitleDescView(title: effect, desc: "", image: "atom")))
            }
        
//        }
        return _res.sorted {
            $0.key < $1.value
        }
    }
    
    
    static func loadTerpeneDataMap(terpenes: [TerpeneJSON]) -> [DataMap]{
        var _terpenes = [DataMap]()
        terpenes.forEach {
            _terpenes.append(DataMap(key: $0.name, value: DictionaryUtil.loadDescription(text: $0.name), view: TerpeneDetailView(terpene: $0)))
        }
        return _terpenes.sorted {
            $0.key < $1.value
        }
    }
    static func loadEffectDataMap(terpenes: [TerpeneJSON], strains: [Strain]) -> [DataMap]{
        var _effects = [DataMap]()
        TerpeneUtil.loadTerpeneEffects(terpenes: terpenes).forEach { effect in
            _effects.append(DataMap(key: effect, value: "", view: ListView(data: StrainUtil.loadStrainDataMap(strains: StrainUtil.loadStrainsByTerpenes(terpenes: TerpeneUtil.loadTerpenesByEffect(effect: effect, terpenes: terpenes), strains: strains)), searchTitle: "Strains With \(effect) Effects")))
        }
//        var _effect = [DataMap]()
//        terpenes.forEach { terpene in
//
//        }
        return _effects.sorted {
            $0.key < $1.value
        }
    }
    
    static func searchEffects(query: String)->[String]{
        return self.loadEffects().filter({$0.lowercased() == query.lowercased()})
//        self.loadAromas().forEach(<#T##body: (String) throws -> Void##(String) throws -> Void#>)
    }
    static func searchAromas(query: String)->[String]{
//        var _res = [String]()
        return self.loadAromas().filter({$0.lowercased() == query.lowercased()})
    }
    static func loadAromaEffectDataMap(data: [String])-> [DataMap]{
        var _res = [DataMap]()
        data.forEach(){ ae in
            _res.append(DataMap(key: ae, value: DictionaryUtil.loadDescription(text: ae), view: TerpeneEffectAromaView(title: ae, description: DictionaryUtil.loadDescription(text: ae))))
            
        }
        return _res
    }
    static func loadAromaDataMap(aromas: [String]) -> [DataMap]{
        var _res = [DataMap]()
        aromas.forEach(){ aroma in
            _res.append(DataMap(key: aroma, value: "", view: ContentView()))
            
        }
        return _res
    }
    static func loadTerpeneDataMapFromStrings(terpenes: [String]) -> [DataMap]{
        var _res = [DataMap]()
        terpenes.forEach(){ terpene in
            _res.append(DataMap(key: terpene, value: DictionaryUtil.loadDescription(text: terpene), view: TerpeneDetailView(terpene: self.loadTerpeneByName(name: terpene))))
            
        }
        return _res
    }
    static func loadEffectDataMap(effects: [String]) -> [DataMap]{
        var _res = [DataMap]()
        effects.forEach(){ effect in
            _res.append(DataMap(key: effect, value: "", view: ContentView()))
            
        }
        return _res
    }
    static func loadTerpeneProfileByUser(user: User)->TerpeneProfile{
        
        return Bundle.main.decode(TerpeneProfile.self, from: "terpene_profile.json")
        
    }
    static func loadAromaDataMap(terpenes: [TerpeneJSON], strains: [Strain]) -> [DataMap]{
        var _aromas = [DataMap]()
        TerpeneUtil.loadTerpeneAromas(terpenes: terpenes).forEach { aroma in
            _aromas.append(DataMap(key: aroma, value: "", view: ListView(data: StrainUtil.loadStrainDataMap(strains: StrainUtil.loadStrainsByTerpenes(terpenes: TerpeneUtil.loadTerpenesByAroma(aroma: aroma, terpenes: terpenes), strains: strains)), searchTitle: "Strains With \(aroma) Aromas`")))
        }
//        var _effect = [DataMap]()
//        terpenes.forEach { terpene in
//
//        }
        return _aromas.sorted {
            $0.key < $1.value
        }
    }
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
        let terpenes = TerpeneUtil.loadTerpenes(viewContext: viewContext)
        print("Terpene count: \(terpenes.count)")
        terpenes.forEach(){terpene in
            viewContext.delete(terpene)
            
        }
        
        do{
            try viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Terpene Count: \(TerpeneUtil.loadAromas(viewContext: viewContext).count)")

    }
    
    static func deleteEffects(viewContext: NSManagedObjectContext){
        let effects = TerpeneUtil.loadEffects(viewContext: viewContext)
        print("Effect count: \(effects.count)")
        effects.forEach(){effect in
            viewContext.delete(effect)
            
        }
        
        do{
            try viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Effect Count: \(TerpeneUtil.loadEffects(viewContext: viewContext).count)")

    }
    static func deleteAromas(viewContext: NSManagedObjectContext){
        let aromas = TerpeneUtil.loadAromas(viewContext: viewContext)
        print("Aroma count: \(aromas.count)")
        aromas.forEach(){aroma in
            viewContext.delete(aroma)
            
        }
        
        do{
            try viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Aroma Count: \(TerpeneUtil.loadAromas(viewContext: viewContext).count)")

    }
    
    
    static func buildEffectCoreData(viewContext: NSManagedObjectContext){
//        @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
        
        if TerpeneUtil.loadEffects(viewContext: viewContext).count == 0 {
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
    
    
    static func buildAromaCoreData(viewContext: NSManagedObjectContext){
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
        
        if TerpeneUtil.loadAromas(viewContext: viewContext).count == 0 {
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
                                    try viewContext.save()
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
    
    
    
    static func buildTerpeneCoreData(viewContext: NSManagedObjectContext){
        //load data in here
        
        if TerpeneUtil.loadTerpenes(viewContext: viewContext).count == 0 {
            //we will need to load terpene data in
            print("Terpene count is zero, we need to load terpene data")
            //            @FetchRequest(sortDescriptors: []) var effects: FetchedResults<Effect>
            //            @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
            //ok so now that we've built the aromas and effects, so now we build terpenes
            let aromas = TerpeneUtil.loadAromas(viewContext: viewContext)
            let effects = TerpeneUtil.loadEffects(viewContext: viewContext)
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
//    static func buildEffectCoreData(viewContext: NSManagedObjectContext){
////        @FetchRequest(sortDescriptors: []) var aromas: FetchedResults<Aroma>
//        @FetchRequest(sortDescriptors: []) var effects: FetchedResults<Effect>
//        let privateContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//        privateContext.parent = viewContext
//
//        if effects.count == 0 {
//            print("No effects have been loaded, loading effects")
//            self.loadEffects().forEach { effectStr in
//                var _effect = Effect(context: viewContext)
////                _effect.desc
//                _effect.name = effectStr
//                _effect.desc = DictionaryUtil.loadDescription(text: effectStr)
//                _effect.id = String(Int.random(in: 1000...5000))
//                privateContext.perform {
//
//                    do {
//
//                        try privateContext.save()
//                            viewContext.performAndWait {
//                                do{
//                                    try viewContext.save()
//                                    print("Wrote effect \(effectStr)")
//                                } catch{
//                                    let nsError = error as NSError
//                                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//                                }
//                        }
//
//                    } catch {
//                        // Replace this implementation with code to handle the error appropriately.
//                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                        let nsError = error as NSError
//                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//                    }
//
//                }
//            }
//        }
//
//
//    }

    
//    static func loadTerpenes()->[Terpene]{
//        return Bundle.main.decode([Terpene].self, from: "terpene.json")
//    }
//    static
}
