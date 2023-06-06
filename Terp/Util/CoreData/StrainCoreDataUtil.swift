//
//  StrainCoreDataUtil.swift
//  Terp
//
//  Created by Andrew on 6/5/23.
//

import Foundation
import CoreData
struct StrainCoreDataUtil{
    static func loadStrains()->[Strain]{
        let viewContext: NSManagedObjectContext = {
            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            moc.parent = PersistenceController.shared.container.viewContext
            return moc
        }()
        let fetchRequest = NSFetchRequest<Strain>(entityName: "Strain")
//        fetchRequest.predicate = NSPredicate(format: "name", <#T##args: CVarArg...##CVarArg#>)
        do{
            let strains = try viewContext.fetch(fetchRequest)
            return strains
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return [Strain]()
    }
    static func deleteStrains(viewContext: NSManagedObjectContext){
        let strains = self.loadStrains()
        print("Strain count: \(strains.count)")
        strains.forEach(){strain in
            viewContext.delete(strain)
            
        }
        
        do{
            try viewContext.save()
        }catch let error as NSError{
            print("Could not delete aromas \(error.userInfo)")
        }
        print("Strain Count: \(self.loadStrains().count)")

    }
    
    static func searchStrainByName(name: String)->Strain? {
        let viewContext: NSManagedObjectContext = {
            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            moc.parent = PersistenceController.shared.container.viewContext
            return moc
        }()
        let fetchRequest = NSFetchRequest<Strain>(entityName: "Strain")
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        do{
            let strains = try viewContext.fetch(fetchRequest)
            return strains.first
        }catch let error as NSError{
            print("Could not load aromas \(error.userInfo)")
        }
        return nil
    }
    static func processStrainLineage(strain: StrainJSON){
        print("Processing lineage for \(strain.name)")
        let viewContext: NSManagedObjectContext = {
            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            moc.parent = PersistenceController.shared.container.viewContext
            return moc
        }()
        let _strain = self.searchStrainByName(name: strain.name)!
//        if self.searchStrainByName(name: strain.name, viewContext: viewContext) == nil{
        print("\(strain.name) has \(strain.parents.count) parents and \(strain.children.count) children")
            for i in 0..<strain.parents.count{
                print("Checking parents of \(strain.name)")
                let parent  = strain.parents[i]
                let _parentObj = self.searchStrainByName(name: parent)
                if _parentObj == nil{
                    print("Parent of \(strain.name): \(parent) is not in CoreData yet, inserting")

                    let strainJSON = StrainJSONUtil.loadStrainByName(name: parent)
                    if strainJSON != nil{
                        insertNewStrain(strain:strainJSON! )
                        print("Attempting to write new strain: \(parent)")
                        let _newParentObj = self.searchStrainByName(name: parent)
                        if _newParentObj != nil{
                            print("Wrote new strain \(parent)")
                            _strain.addToChildren(_newParentObj!)
                            print("Creating parent relationship between \(strain.name) <==> \(_newParentObj!.name!)")
                        }
                        
                    }
                }else{
                    if !_strain.parents!.contains(where: {$0.name!.lowercased() == _parentObj!.name!.lowercased() }){
                        _strain.addToParents(_parentObj!)
                        print("Creating parent relationship between \(strain.name) <==> \(_parentObj!.name!)")
                    }
                    
                }
            }
            for i in 0..<strain.children.count{
                let child = strain.children[i]
                print("Checking children of \(strain.name)")
                let _childObj = self.searchStrainByName(name: child)
                if _childObj == nil{
                    print("Child of \(strain.name): \(child) is not in CoreData yet, inserting")
                    let strainJSON = StrainJSONUtil.loadStrainByName(name: child)
                    if strainJSON != nil{
                        insertNewStrain(strain: strainJSON!)
                        let _newChildObj = self.searchStrainByName(name: child)
                        if _newChildObj != nil{
                            _strain.addToChildren(_newChildObj!)
                        }

                    }
                }else{
                    _strain.addToParents(_childObj!)
                    print("Creating child relationship between \(strain.name) <==> \(_childObj!.name!)")
            
                }
            }
        
            do{
                try viewContext.save()
                print("Wrote Strain lineage for \(strain.name):\(strain.id!) to CoreData")
            }catch let error as NSError{
                print("Could not write strain lineage for \(strain.name) \(error.userInfo) \(error.localizedDescription)")
            }
        
        
        
    }
    static func insertNewStrain(strain: StrainJSON){
//        var viewContext = PersistenceController.shared.container.viewContext
//        viewContext.concurrencyType = .privateQueueConcurrencyType
        let viewContext: NSManagedObjectContext = {
            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            moc.parent = PersistenceController.shared.container.viewContext
            return moc
        }()
        if self.searchStrainByName(name: strain.name) == nil{
            let terpenes = TerpeneCoreDataUtil.loadTerpenes(viewContext: viewContext)
            print("Working with \(terpenes.count) terpenes")
            let _strain = Strain(context: viewContext)
            _strain.id = strain.id
            _strain.name = strain.name
            _strain.desc = strain.description
            _strain.image = strain.image
            _strain.aliases = strain.aliases.joined(separator: ",")
            _strain.url = strain.url
            for i in 0..<strain.terpenes.count{
                _strain.addToTerpenes(terpenes.filter({$0.name!.lowercased() == strain.terpenes[i].lowercased()}).first!)
            }
            //ok so now the pain will be in loading the parents and children, assuming the recursion doesn't work accordingly

            do{
                try viewContext.save()
                print("Wrote Strain \(strain.name):\(strain.id!) to CoreData")
            }catch let error as NSError{
                print("Could not insert strain \(strain.name) \(error.userInfo) \(error.localizedDescription)")
            }
        }else{
            print("Strain: \(strain.name):\(strain.id!) is already in CoreData, skipping")
        }
    }
    
    static func buildStrainCoreData(){
        //load data in here
//        let viewContext: NSManagedObjectContext = {
//            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//            moc.parent = PersistenceController.shared.container.viewContext
//            return moc
//        }()
            let strains = StrainJSONUtil.loadInitalStrainData()
            var batches = [[StrainJSON]]()
            let batchSize = 2000
            var count = 0
            strains.forEach(){ strain in
                if count == 0 || count % batchSize == 0{
                    batches.append([StrainJSON]())
                
                }
//                batches[batches.count-1]
                batches[batches.count-1].append(strain)
                count += 1
                
            }
//            DispatchQ

        for iBatch in 0..<batches.count{
            let batch = batches[iBatch]
                    DispatchQueue.global(qos: .background).async {
                        // fetch animation based on status
                        // on global background thread so as not to block the main thread
                        //                 let animation = getAnimation(status)
                        print(Thread.current)
                        print("Spawing new thread to process \(batch.count) strains")
                        if count != self.loadStrains().count{
                            for iStrain in 0..<batch.count{
                                let strain = batch[iStrain]
                                print("Processing \(iStrain)/\(batch.count) strains (insert) in batch \(iBatch)/\(batches.count)")
                                insertNewStrain(strain: strain)
                                //                            processStrainLineage(strain: strain)
                                
                            }
                        } //ok so if all strains are mapped just check lineage
                        for iStrain in 0..<batch.count{
                            let strain = batch[iStrain]
                            print("Processing \(iStrain)/\(batch.count) strains (lineage) in batch \(iBatch)/\(batches.count)")
                            processStrainLineage(strain: strain)
//                            processStrainLineage(strain: strain)
                            
                        }
                    }
                
            
                }
//        for iBatch in 0..<batches.count{
//            let batch = batches[iBatch]
//                    DispatchQueue.global(qos: .background).async {
//                        // fetch animation based on status
//                        // on global background thread so as not to block the main thread
//                        //                 let animation = getAnimation(status)
//                        print(Thread.current)
//                        print("Spawing new thread to process \(batch.count) strains")
//
//                        for iStrain in 0..<batch.count{
//                            let strain = batch[iStrain]
//                            print("Processing \(iStrain)/\(batch.count) strains (lineage) in batch \(iBatch)/\(batches.count)")
////                            insertNewStrain(strain: strain)
//                            processStrainLineage(strain: strain)
//
//                        }
//                    }
//
//
//                }

        print("Test")
//        if self.loadStrains(viewContext: viewContext).count == 0 {
//            //we will need to load terpene data in
//            print("Strain count is zero, we need to load Strain data")
//
//
//            StrainUtil.loadStrains().forEach(){ strain in
//                self.insertNewStrain(strain: strain, viewContext: viewContext)
//                
//            }
//                let _terpene = Terpene(context: viewContext)
//                _terpene.id = String(Int.random(in: 1000...5000))
//                _terpene.name = terpene.name
//                _terpene.desc = terpene.description
//                _terpene.image = terpene.image
//                terpene.aromas.forEach(){ _aroma in
//                    //                    @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Aroma., ascending: true)]) var aromas: FetchedResults<Aroma>
//                    //                    do{
//                    //                        let request : NSFetchRequest <Aroma>
//                    //                        let aroma = viewContext.fetch(<#T##request: NSFetchRequest<NSFetchRequestResult>##NSFetchRequest<NSFetchRequestResult>#>)
//                    _terpene.addToAromas(aromas.filter({$0.name!.lowercased() == _aroma.lowercased() }).first!)
//                    //                    }
//
//                }
//                terpene.effects.forEach(){ _effect in
//                    _terpene.addToEffects(effects.filter({$0.name!.lowercased() == _effect.lowercased() }).first!)
//                }
//                do {
//                    try viewContext.save()
//                    print("Wrote terpene \(terpene.name)")
//                } catch {
//                    // Replace this implementation with code to handle the error appropriately.
//                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                    let nsError = error as NSError
//                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//                }
//
//
//            }
            
        
    }
}
