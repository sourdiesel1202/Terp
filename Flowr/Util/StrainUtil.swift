//
//  StrainUtil.swift
//  Flowr
//
//  Created by Andrew on 5/14/23.
//

import Foundation
struct StrainUtil{
    
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
            _res.append(DataMap(key: strain.name, value: strain.type, view: StrainDetailView(strain: strain)))
        }
        return _res
    }
    
    static func loadStrainByName(name: String, strains: [Strain]) -> Strain? {
        return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
//    static func loadStrains()->[Strain]{
//        return Bundle.main.decode([Strain].self, from: "strain_data.json")
//    }
}
