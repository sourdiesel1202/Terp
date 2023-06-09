//
//  StrainUtil.swift
//  Flowr
//
//  Created by Andrew on 5/14/23.
//

import Foundation
struct StrainJSONUtil{
    static func shouldUseCoreData()-> Bool{
        return StrainCoreDataUtil.loadStrains().count >= Bundle.main.decode([StrainJSON].self, from: "strain_data_demo.json").count
    }
    static func loadInitalStrainData() -> [StrainJSON]{
        return Bundle.main.decode([StrainJSON].self, from: "strain_data.json")
    }
    static func convertCoreDataToJSON(strains: [Strain])->[StrainJSON]{
        var res = [StrainJSON]()
        strains.forEach(){ strain in
            res.append(convertCoreDataToJSON(_strain: strain))
        }
        
        return res
        
    }
    static func convertCoreDataToJSON(_strain: Strain)->StrainJSON{
        var terpenes = [String]()
        _strain.terpenes!.forEach(){ terpene in
            terpenes.append(terpene.name!)
        }
        var parents = [String]()
        _strain.parents!.forEach(){ parent in
            parents.append(parent.strain!.name!)
        }
        var children = [String]()
        _strain.children!.forEach(){ child in
            children.append(child.strain!.name!)
        }
        return  StrainJSON( id: _strain.id,url: _strain.url!, name: _strain.name!, description: _strain.desc!, image: _strain.image!, terpenes: terpenes, children: children, parents: parents, aliases: _strain.aliases!.components(separatedBy: ","), type: _strain.type!)
//        _strains.append(strainJson)
        
    }
    static func loadStrains() -> [StrainJSON]{
        print("Strain Count in Core Data: \(StrainCoreDataUtil.loadStrains().count)")
        //basically the idea here is that if we have more in core data than we do in the demo file, we should use the demo file
        if !self.shouldUseCoreData() {
            print("returning demo strain data")
            return Bundle.main.decode([StrainJSON].self, from: "strain_data_demo.json")
        }else{
            //otherwise, we can use core data
            print("returning data from core data")
            var _strains = [StrainJSON]()
            StrainCoreDataUtil.loadStrains().forEach(){ _strain in
                _strains.append(self.convertCoreDataToJSON(_strain: _strain))
            }
            print("returning \(_strains.count) strains")
            return _strains
//            return StrainCoreDataUtil.loadStrains(viewContext: PersistenceController.shared.container.viewContext)
            
        }
//        return Bundle.main.decode([StrainJSON].self, from: "strain_data.json")
    }
//    static func loadPublicReviewsByStrain(strain: Strain) -> [Review]{
//        return ReviewUtil.loadReviewsByUser(user: <#T##User#>)
//    }
    static func loadStrainChildren(strain: StrainJSON) -> [StrainJSON]{
        var strainDict: [String:Strain]? = [String:Strain]()
        if self.shouldUseCoreData(){
            return self.convertCoreDataToJSON(strains: StrainCoreDataUtil.loadStrainChildren(strain: StrainCoreDataUtil.loadStrainByName(name: strain.name, viewContext: PersistenceController.shared.container.viewContext, strainDict: &strainDict )!))
        }else{
            return self.loadStrains().filter({$0.parents.contains(where: {$0.lowercased() == strain.name.lowercased()})})
        }
    }
    static func loadStrainParents(strain: StrainJSON) -> [StrainJSON]{
        var strainDict: [String:Strain]? = [String:Strain]()
        if self.shouldUseCoreData(){
            return self.convertCoreDataToJSON(strains: StrainCoreDataUtil.loadStrainChildren(strain: StrainCoreDataUtil.loadStrainByName(name: strain.name, viewContext: PersistenceController.shared.container.viewContext, strainDict: &strainDict)!))
        }else{
            var _res = [StrainJSON]()
            strain.parents.forEach(){ name in
                if self.loadStrains().contains(where: {$0.name.lowercased()==name.lowercased()}){
                    _res.append(self.loadStrainByName(name: name)!)
                }
                
            }
            return _res

        }
        
    }
    static func loadStrainsByTerpene(terpene: TerpeneJSON) -> [StrainJSON]{
        
        var _res = [StrainJSON]()
        self.loadStrains().forEach { strain in
            if strain.terpenes.contains(terpene.name){
                _res.append(strain)
            }
            //            if strain.terpenes.
            //                _res.append(strain)
            //            }
        }
        return _res
    }
    static func searchStrainByName(name: String)-> [StrainJSON]{
        if self.shouldUseCoreData(){
            return self.convertCoreDataToJSON(strains: StrainCoreDataUtil.searchStrainsByName(name: name))
        }else{
            return self.loadStrains().filter({$0.name.lowercased().contains(name.lowercased())})
        }
    }
    static func loadStrainsByTerpene(terpene: TerpeneJSON, strains: [StrainJSON]) -> [StrainJSON]{
        
        var _res = [StrainJSON]()
        strains.forEach { strain in
            if strain.terpenes.contains(terpene.name){
                _res.append(strain)
            }
            //            if strain.terpenes.
            //                _res.append(strain)
            //            }
        }
        return _res
    }
    static func loadStrainsByTerpenes(terpenes: [TerpeneJSON], strains: [StrainJSON]) -> [StrainJSON]{
        var _res = [StrainJSON]()
        strains.forEach { strain in
            terpenes.forEach { terpene in
                
                
                if strain.terpenes.contains(terpene.name){
                    _res.append(strain)
                }
            }
        }
        return _res
    }
    
    static func loadStrainDataMap(strains: [StrainJSON])->[DataMap]{
        var _res = [DataMap]()
        strains.forEach { strain in
            _res.append(DataMap(key: strain.name, value: "\(strain.description.prefix(150))...", view: StrainDetail2_0View(strain: strain), secondaryValue: strain.terpenes.count > 0 ? "Terpenes: \(strain.terpenes.joined(separator: ",")) ": "", image: strain.image))
        }
        return _res
    }
    
    static func loadStrainByName(name: String, strains: [StrainJSON]) -> StrainJSON? {
        return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
    static func loadStrainByName(name: String) -> StrainJSON? {
        var strainDict: [String:Strain]? = [String:Strain]()
        if self.shouldUseCoreData(){
            return convertCoreDataToJSON(_strain: StrainCoreDataUtil.loadStrainByName(name: name, viewContext: PersistenceController.shared.container.viewContext, strainDict: &strainDict)!)
        }else{
            
            return self.loadStrains().filter({$0.name.lowercased()==name.lowercased()}).first
            
        }
    }
    static func loadStrainAromas(strain: StrainJSON) -> [String] {
        var res  = [String]()
        strain.terpenes.forEach { (strTerp: String) in
            
            //            var terp = TerpeneUtil.loadTerpeneByName(name: strTerp){}
            
            TerpeneJSONUtil.loadTerpeneByName(name: strTerp).aromas.forEach(){ aroma in
                if !res.contains(where:{ $0.lowercased() == aroma.lowercased() }){
                    res.append(aroma)
                }
                
                
            }
            
            
        }
        return res
    }
    
    static func loadStrainEffects(strain: StrainJSON) -> [String] {
        var res  = [String]()
        strain.terpenes.forEach { (strTerp: String) in
            
            //            var terp = TerpeneUtil.loadTerpeneByName(name: strTerp){}
            
            TerpeneJSONUtil.loadTerpeneByName(name: strTerp).effects.forEach(){ effect in
                if !res.contains(where:{ $0.lowercased() == effect.lowercased() }){
                    res.append(effect)
                }
                
                
            }
            
            
        }
        return res
    }
        
//    static func loadStrains()->[Strain]{
//        return Bundle.main.decode([Strain].self, from: "strain_data.json")
//    }
}
