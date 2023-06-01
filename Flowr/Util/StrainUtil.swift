//
//  StrainUtil.swift
//  Flowr
//
//  Created by Andrew on 5/14/23.
//

import Foundation
struct StrainUtil{
    
    static func loadStrains() -> [Strain]{
        return Bundle.main.decode([Strain].self, from: "strain_data.json")
    }
//    static func loadPublicReviewsByStrain(strain: Strain) -> [Review]{
//        return ReviewUtil.loadReviewsByUser(user: <#T##User#>)
//    }
    static func loadStrainsByTerpene(terpene: Terpene) -> [Strain]{
        
        var _res = [Strain]()
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
    static func searchStrainByName(name: String)-> [Strain]{
        return self.loadStrains().filter({$0.name.lowercased().contains(name.lowercased())})
    }
    static func loadStrainsByTerpene(terpene: Terpene, strains: [Strain]) -> [Strain]{
        
        var _res = [Strain]()
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
    static func loadStrainsByTerpenes(terpenes: [Terpene], strains: [Strain]) -> [Strain]{
        var _res = [Strain]()
        strains.forEach { strain in
            terpenes.forEach { terpene in
                
                
                if strain.terpenes.contains(terpene.name){
                    _res.append(strain)
                }
            }
        }
        return _res
    }
    
    static func loadStrainDataMap(strains: [Strain])->[DataMap]{
        var _res = [DataMap]()
        strains.forEach { strain in
            _res.append(DataMap(key: strain.name, value: strain.type, view: StrainDetail2_0View(strain: strain)))
        }
        return _res
    }
    
    static func loadStrainByName(name: String, strains: [Strain]) -> Strain? {
        return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
    static func loadStrainByName(name: String) -> Strain? {
        return self.loadStrains().filter({$0.name.lowercased()==name.lowercased()}).first
    }
    static func loadStrainAromas(strain: Strain) -> [String] {
        var res  = [String]()
        strain.terpenes.forEach { (strTerp: String) in
            
            //            var terp = TerpeneUtil.loadTerpeneByName(name: strTerp){}
            
            TerpeneUtil.loadTerpeneByName(name: strTerp).aromas.forEach(){ aroma in
                if !res.contains(where:{ $0.lowercased() == aroma.lowercased() }){
                    res.append(aroma)
                }
                
                
            }
            
            
        }
        return res
    }
    
    static func loadStrainEffects(strain: Strain) -> [String] {
        var res  = [String]()
        strain.terpenes.forEach { (strTerp: String) in
            
            //            var terp = TerpeneUtil.loadTerpeneByName(name: strTerp){}
            
            TerpeneUtil.loadTerpeneByName(name: strTerp).effects.forEach(){ effect in
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
