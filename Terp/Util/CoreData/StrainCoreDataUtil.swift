//
//  StrainCoreDataUtil.swift
//  Terp
//
//  Created by Andrew on 6/5/23.
//

import Foundation
import CoreData
import SwiftUI
struct StrainCoreDataUtil{
//    var strainsMapped = [String:Strain]()
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
            print("Could not load strains \(error.userInfo)")
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
    
    static func loadStrainByName(name: String, viewContext: NSManagedObjectContext, strainDict: inout [String:Strain]?) throws ->Strain {
//        let viewContext: NSManagedObjectContext = {
//            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//            moc.parent = PersistenceController.shared.container.viewContext
//            return moc
//        }()
//        if strainDict != nil {
//
//        }else{
            
        if strainDict != nil{
            if strainDict!.keys.contains(where: {$0 == name}){
                print("Returning strain dict value: \(name)")
                return strainDict![name]!
            }
        }
            let fetchRequest = NSFetchRequest<Strain>(entityName: "Strain")
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            
            do{
                let strains = try viewContext.fetch(fetchRequest)
                if strainDict != nil{
//                    strainDict.update
                    if strains.count > 0{
                        strainDict!.updateValue(strains.first!, forKey: name)
                        print("Updating strain dict with value \(name)")
                    }
                }
                if strains.count > 0 {
                    return strains.first!
                    
                }else{
                    throw StrainError.strainNotFound
                }
                
                
            }catch let error as NSError{
                print("Could not load strain \(name) from core data \(error.userInfo)")
            }
        throw StrainError.strainNotFound
//        }
    }
    
    static func loadStrainParents(strain: Strain) throws ->[Strain] {
        let viewContext: NSManagedObjectContext = {
            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            moc.parent = PersistenceController.shared.container.viewContext
            return moc
        }()
        
        //ok so we're going to rethink this
        let fetchRequest = NSFetchRequest<Strain>(entityName: "Strain")
        fetchRequest.predicate = NSPredicate(format: "children CONTAINS %@", strain)
        //fetch all strain children where the strain is the strain we are loading children for
        var strainDict: [String : Strain]? = [String:Strain]()
        do{
            var res = [Strain]()
            let parentStrains = try viewContext.fetch(fetchRequest)
            do{
                try parentStrains.forEach(){ parent in
                    do{
                        let _parent = try self.loadStrainByName(name: parent.name!, viewContext: viewContext, strainDict:&strainDict )
                        res.append(_parent)
                    }catch{
                        throw StrainError.parentNotFound
                    }
                }
            }catch{
                throw StrainError.parentNotFound
            }
            return res
//            return strains
        }catch let error as NSError{
            print("Could not load parents for \(strain.name!) \(error.userInfo)")
        }
        return [Strain]()
    }
    static func loadStrainChildren(strain: Strain)->[Strain] {
        let viewContext: NSManagedObjectContext = {
            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            moc.parent = PersistenceController.shared.container.viewContext
            return moc
        }()
        
        //ok so we're going to rethink this
        let fetchRequest = NSFetchRequest<Strain>(entityName: "Strain")
        fetchRequest.predicate = NSPredicate(format: "parents CONTAINS %@", strain)
        //fetch all strain children where the strain is the strain we are loading children for
        var strainDict: [String : Strain]? = [String:Strain]()
        do{
            var res = [Strain]()
            let childStrains = try viewContext.fetch(fetchRequest)
            do{
                try childStrains.forEach(){ child in
                    do{
                        
                        let _child = try self.loadStrainByName(name: child.name!, viewContext: viewContext, strainDict:&strainDict )
                        res.append(_child)
                    }catch{
                        throw StrainError.childNotFound
                    }
                }
            }catch{
                throw StrainError.childNotFound
            }
            
            return res
//            return strains
        }catch let error as NSError{
            print("Could not load children for \(strain.name!) \(error.userInfo)")
        }
        return [Strain]()
    }
    
    static func searchStrainsByName(name: String)->[Strain] {
        let viewContext: NSManagedObjectContext = {
            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
            moc.parent = PersistenceController.shared.container.viewContext
            return moc
        }()
        let fetchRequest = NSFetchRequest<Strain>(entityName: "Strain")
        fetchRequest.predicate = NSPredicate(format: "name contains[cd] %@", name.lowercased())
        do{
            let strains = try viewContext.fetch(fetchRequest)
            return strains
        }catch let error as NSError{
            print("Could not search for strains by keyword \(name) \(error.userInfo)")
        }
        return [Strain]()
    }
    static func processStrainLineage(strain: StrainJSON, viewContext: NSManagedObjectContext, strainDict: inout [String:Strain]?) throws {
        print("Processing lineage for \(strain.name)")
//        let viewContext: NSManagedObjectContext = {
//            let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
//            moc.parent = PersistenceController.shared.container.viewContext
//            return moc
//        }()
        do{
            let _strain = try self.loadStrainByName(name: strain.name, viewContext: viewContext, strainDict: &strainDict)
        
//        if self.searchStrainByName(name: strain.name, viewContext: viewContext) == nil{
//        let coreDataStrain = loadStrainByName(name: strain.name, viewContext: viewContext)
        print("\(strain.name) has \(strain.parents.count) parents and \(strain.children.count) children")
            for i in 0..<strain.parents.count{
                print("Checking parents of \(strain.name)")
                let parent  = strain.parents[i]
                do{
                    let _parentObj = try  self.loadStrainByName(name: parent, viewContext: viewContext, strainDict: &strainDict)
                    if _parentObj == nil{
                        print("Parent of \(strain.name): \(parent) is not in CoreData yet, inserting")

                        let strainJSON = StrainJSONUtil.loadInitalStrainData().filter({$0.name.lowercased() == parent.lowercased()}).first
                        if strainJSON != nil{
                            print("Attempting to write new parent strain: \(parent)")
                            insertNewStrain(strain:strainJSON!, viewContext: viewContext, strainDict: &strainDict)
                            print("Attempting search parent strain in core data: \(parent)")
                            do {
                                let _newParentObj = try self.loadStrainByName(name: parent, viewContext: viewContext, strainDict: &strainDict)
                                
                                
                                    print("Found \(parent) in core data")
                                    //                            let parentStrain = StrainParent(context: viewContext)
                                    //                            parentStrain.setValue(UUID(), forKey: "id")
                                    //                            parentStrain.strain = _newParentObj
                                    //                            parentStrain.child = coreDataStrain//loadStrainByName(name: strain.name, viewContext: viewContext)
                                    _strain.addToParents(_newParentObj)
                                    print("Creating parent relationship between \(strain.name) <==> \(_newParentObj.name!)")
                                
                            }catch{
                                throw StrainError.parentNotFound
                            }
                            
                        }
                    }else{
                        print("Checking for existing relationship between \(strain.name) and \(_parentObj.name!) ")
                        if !_strain.parents!.contains(where: {$0.name!.lowercased() == _parentObj.name!.lowercased() }){
    //                    if !_strain!.parents!.contains(where: {$0.strain!.name!.lowercased() == _parentObj!.name!.lowercased() }){
    //                        let parentStrain = StrainParent(context: viewContext)
    //                        parentStrain.setValue(UUID(), forKey: "id")
    //                        parentStrain.strain = _parentObj
    ////                        parentStrain.child = coreDataStrain// loadStrainByName(name: strain.name, viewContext: viewContext)
                            _strain.addToParents(_parentObj)
                            print("Creating parent relationship between \(strain.name) <==> \(_parentObj.name!)")
                        }
                        
                    }
                }catch{
                    throw StrainError.parentNotFound
                }

            }
            do{
                for i in 0..<strain.children.count{
                    let child = strain.children[i]
                    print("Checking children of \(strain.name)")
                    
                    let _childObj = try self.loadStrainByName(name: child, viewContext: viewContext, strainDict: &strainDict)
                    if _childObj == nil{
                        print("Child of \(strain.name): \(child) is not in CoreData yet, inserting")
                        let strainJSON = StrainJSONUtil.loadInitalStrainData().filter({$0.name.lowercased() == child.lowercased()}).first//loadStrainByName(name: child)
                        print("Loaded strain data from json")
                        if strainJSON != nil{
                            print("Attempting to i nsert \(strainJSON!.name) into core data")
                            insertNewStrain(strain: strainJSON!, viewContext: viewContext, strainDict: &strainDict)
                            let _newChildObj = try self.loadStrainByName(name: child, viewContext: viewContext, strainDict: &strainDict)
                            print("Searching for \(strainJSON!.name) in core data")
                            
                                //                            _strain.addToChildren(<#T##value: StrainChild##StrainChild#>)
                                print("Found \(strainJSON!.name) in core data")
                                //                            let childStrain = StrainChild(context: viewContext)
                                //                            childStrain.setValue(UUID(), forKey: "id")
                                //                            childStrain.strain = _newChildObj
                                ////                            childStrain.parent = coreDataStrain//loadStrainByName(name: strain.name, viewContext: viewContext)
                                _strain.addToChildren(_newChildObj)
                                print("Creating child relationship between \(strain.name) <==> \(_newChildObj.name!)")
                            
                            
                        }
                    }else{
                        //                    let childStrain = StrainChild(context: viewContext)
                        //                    childStrain.setValue(UUID(), forKey: "id")
                        //                    childStrain.strain = _childObj
                        ////                    childStrain.parent = coreDataStrain//loadStrainByName(name: strain.name, viewContext: viewContext)
                        _strain.addToChildren(_childObj)
                        print("Creating child relationship between \(strain.name) <==> \(_childObj.name!)")
                        
                        
                    }
                }
            }catch{
                
            }
            do{
                try viewContext.save()
                print("Wrote Strain lineage for \(strain.name):\(strain.id!) to CoreData")
            }catch let error as NSError{
                print("Could not write strain lineage for \(strain.name) \(error.userInfo) \(error.localizedDescription)")
            }
        }catch{
            throw StrainError.strainNotFound
        }
        
        
    }
    static func insertNewStrain(strain: StrainJSON, viewContext: NSManagedObjectContext, strainDict:  inout [String:Strain]?){
        //        var viewContext = PersistenceController.shared.container.viewContext
        //        viewContext.concurrencyType = .privateQueueConcurrencyType
        do {
              let strain = try self.loadStrainByName(name: strain.name, viewContext: viewContext, strainDict: &strainDict)
    }catch{
            let terpenes = TerpeneCoreDataUtil.loadTerpenes(viewContext: viewContext)
//            print("Working with \(terpenes.count) terpenes")
            let _strain = Strain(context: viewContext)
            _strain.id = strain.id
            _strain.name = strain.name
            _strain.desc = strain.description
            _strain.image = strain.image
            _strain.aliases = strain.aliases.joined(separator: ",")
            _strain.url = strain.url
            print("Processing terpenes for \(strain.name)")
            for i in 0..<strain.terpenes.count{
                _strain.addToTerpenes(terpenes.filter({$0.name!.lowercased() == strain.terpenes[i].lowercased()}).first!)
            }
            //ok so now the pain will be in loading the parents and children, assuming the recursion doesn't work accordingly

            do{
                try viewContext.save()
                print("Wrote Strain \(strain.name):\(strain.id!) to CoreData")
                if strainDict != nil{
                    if !strainDict!.keys.contains(where:{$0 == strain.name}){
                        strainDict?.updateValue(_strain, forKey: strain.name)
                        print("Updating strain dict with value: \(strain.name)")
                    }
                }
            }catch let error as NSError{
                print("Could not insert strain \(strain.name) \(error.userInfo) \(error.localizedDescription)")
            }
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
            let batchSize = 11000
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
            let timer = Date.now
     
            DispatchQueue.global(qos: .utility).async {
                let viewContext: NSManagedObjectContext = {
                    let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                    moc.parent = PersistenceController.shared.container.viewContext
                    return moc
                }()
                // fetch animation based on status
                // on global background thread so as not to block the main thread
                //                 let animation = getAnimation(status)
                //                viewContext.parent
                var strainDict: [String : Strain]? = [String:Strain]()
                print(Thread.current)
                print("Spawing new thread to process \(batch.count) strains")
                if count != self.loadStrains().count{
                    for iStrain in 0..<batch.count{
                        let strain = batch[iStrain]
                        print("Processing \(iStrain)/\(batch.count) strains (insert) in batch \(iBatch)/\(batches.count)")
                        insertNewStrain(strain: strain, viewContext: viewContext, strainDict: &strainDict)
                        //                        processStrainLineage(strain: strain, viewContext: viewContext)
                        //                            processStrainLineage(strain: strain)
                        
                    }
                    for iStrain in 0..<batch.count{
                        let strain = batch[iStrain]
                        print("Processing \(iStrain)/\(batch.count) strains (lineage) in batch \(iBatch)/\(batches.count)")
                        //                        insertNewStrain(strain: strain, viewContext: viewContext)
                        do{
                            try processStrainLineage(strain: strain, viewContext: viewContext, strainDict: &strainDict)
                        }catch{
                            print("Could not process strain lineage for \(strain.name)")
                        }
                        //                            processStrainLineage(strain: strain)
                        
                    }
                    print("Thread \(Thread.current) completed")
                    
                    //                        }
                }
                
                print("Completed strain data load in \(timer.timeAgo())")
                do{
                    try viewContext.parent!.save()
                    
                }catch let error as NSError{
                    fatalError("Could not save core data persistently \(error.localizedDescription): \(error.userInfo) ")
                }
            }
            print("Threads completed")
            
        }
    }
}
