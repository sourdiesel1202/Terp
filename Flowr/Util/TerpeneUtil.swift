//
//  TerpeneUtil.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import Foundation
//import SwiftUI
struct TerpeneUtil{
    static func loadTerpenesByAroma(aroma: String, terpenes: [Terpene]) -> [Terpene]{
        var _res = [Terpene]()
        terpenes.forEach { terpene in
            if !_res.contains(terpene) && terpene.aromas.contains(aroma){
                _res.append(terpene)
            }
        }
        return _res.sorted {
            $0.name < $1.name
        }
        
    }
    static func loadTerpeneByName(name: String, terpenes: [Terpene]) -> Terpene{
        return terpenes.filter({$0.name.lowercased()==name.lowercased()}).first!
//        var _res = [Terpene]()
//        terpenes.forEach { terpene in
//            if !_res.contains(terpene) && terpene.aromas.contains(aroma){
//                _res.append(terpene)
//            }
//        }
//        return _res.sorted {
//            $0.name < $1.name
//        }
        
    }
    static func loadTerpenesByEffect(effect: String, terpenes: [Terpene]) -> [Terpene]
    {
        var _res = [Terpene]()
        terpenes.forEach { terpene in
            if !_res.contains(terpene) && terpene.effects.contains(effect){
                _res.append(terpene)
            }
        }
        return _res.sorted {
            $0.name < $1.name
        }
    }
    
    static func loadTerpeneAromas(terpenes: [Terpene])->[String]{
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
    static func loadTerpeneAromas(terpenes: [Terpene])->[DataMap]{
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
    
    static func loadTerpeneEffects(terpenes: [Terpene])->[String]{
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
    static func loadTerpeneEffects(terpenes: [Terpene])->[DataMap]{
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
    
    
    static func loadTerpeneDataMap(terpenes: [Terpene]) -> [DataMap]{
        var _terpenes = [DataMap]()
        terpenes.forEach {
            _terpenes.append(DataMap(key: $0.name, value: "", view: TerpeneDetailView(terpene: $0)))
        }
        return _terpenes.sorted {
            $0.key < $1.value
        }
    }
    static func loadEffectDataMap(terpenes: [Terpene], strains: [Strain]) -> [DataMap]{
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
            _res.append(DataMap(key: terpene, value: "", view: ContentView()))
            
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
    static func loadAromaDataMap(terpenes: [Terpene], strains: [Strain]) -> [DataMap]{
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
//    static func loadTerpenes()->[Terpene]{
//        return Bundle.main.decode([Terpene].self, from: "terpene.json")
//    }
//    static
}
