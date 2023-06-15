//
//  TerpeneUtil.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import Foundation
import SwiftUI
import CoreData

struct TerpeneJSONUtil{
//    @Environment(\.managedObjectContext) private var viewContext
    
    static func loadTerpenes() -> [TerpeneJSON]  {
        let viewContext = PersistenceController.shared.container.viewContext
        let fetchRequest = NSFetchRequest<Terpene>(entityName: "Terpene")
        var terpenes = [TerpeneJSON]()
        do{
            let _terpenes = try viewContext.fetch(fetchRequest)
            _terpenes.forEach(){ terp in
                var _aromas = [EffectAromaJSON]()
                var _effects = [EffectAromaJSON]()
                terp.aromas!.forEach(){ (aroma: Aroma) in
                    _aromas.append(EffectAromaJSON(id: aroma.id!, name: aroma.name!, description: aroma.desc!, image: aroma.image!))
                }
                terp.effects!.forEach(){ effect in
                    _effects.append(EffectAromaJSON(id: effect.id!, name: effect.name!, description: effect.desc!, image: effect.image!))
                }
                terpenes.append(TerpeneJSON(name: terp.name!, description: terp.desc!, aromas: _aromas, effects: _effects, image: terp.image!))
            }
        } catch let error as NSError{
            print("could not load terpenes from core data \(error.userInfo): \(error)")
        }
        print("Terpenes in core data \(terpenes.count)")
        // ok so the idea here is basically that if CD is empty we need to return from json. not ideal, but it works
        if terpenes.count == 0 {
            print("Loaded Terpene JSON file")
            return Bundle.main.decode([TerpeneJSON].self, from: "terpene.json")
        }else{
            print("Loaded Terpene Core Data ")
            return terpenes
        }
//        return terpenes
        //    return strains.filter({$0.name.lowercased()==name.lowercased()}).first
    }
    
    
    static func searchTerpenesByName(name: String) -> [TerpeneJSON]{
        return self.loadTerpenes().filter({$0.name.lowercased().contains(name.lowercased())})
    }
//    static func search
    static func loadEffectsByNames(names: [String]) throws -> [EffectAromaJSON]{
        var _res = [EffectAromaJSON]()
        do{
            try names.forEach { effectName in
                let effect = try TerpeneCoreDataUtil.loadEffectByName(name: effectName, viewContext: PersistenceController.shared.container.viewContext)
                _res.append(EffectAromaJSON(id: effect.id!, name: effect.name!, description: effect.desc!, image: effect.image!))
                //            if !_res.contains(terpene) && terpene.aromas.contains(aroma){
                //                _res.append(terpene)
                //            }
            }
            
        }catch{
            throw TerpeneError.cannotLoadEffects
        }
        
        return _res
    }
    
    static func loadAromasByNames(names: [String]) throws -> [EffectAromaJSON]{
        var _res = [EffectAromaJSON]()
        do{
            try names.forEach { aromaName in
                let aroma = try TerpeneCoreDataUtil.loadAromaByName(name: aromaName, viewContext: PersistenceController.shared.container.viewContext)
                _res.append(EffectAromaJSON(id: aroma.id!, name: aroma.name!, description: aroma.desc!, image: aroma.image!))
                //            if !_res.contains(terpene) && terpene.aromas.contains(aroma){
                //                _res.append(terpene)
                //            }
            }
            
        }catch{
            throw TerpeneError.cannotLoadAromas
        }
        
        return _res
    }
    static func loadTerpenesByAroma(aroma: String, terpenes: [TerpeneJSON]) -> [TerpeneJSON]{
        var _res = [TerpeneJSON]()
        terpenes.forEach { terpene in
            if !_res.contains(terpene) && terpene.aromas.contains(where: {$0.name.lowercased() == aroma.lowercased()}){
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
    static func convertCoreDataAromasToAromaEffect(aromas: [Aroma])->[EffectAromaJSON]{
        var _res = [EffectAromaJSON]()
        for i in (0..<aromas.count){
            let aroma = aromas[i]
//        aromas.forEach(){aroma in
            _res.append(EffectAromaJSON(id: aroma.id!, name: aroma.name!, description: aroma.desc!, image: aroma.image!))
        }
        return _res
    }
    static func convertCoreDataEffectsToAromaEffect(effects: [Effect])->[EffectAromaJSON]{
        var _res = [EffectAromaJSON]()
        for i in (0..<effects.count){
            let effect = effects[i]
            _res.append(EffectAromaJSON(id: effect.id!, name: effect.name!, description: effect.desc!, image: effect.image!))
        }
        return _res
    }
    static func loadTerpenesByName(names: [String]) throws -> [TerpeneJSON]{
        var _res = [TerpeneJSON]()
//        let terpenes = self.loadTerpenes()
        do {
            try names.forEach(){ name in
                let terpene = try TerpeneCoreDataUtil.loadTerpeneByName(name: name, viewContext: PersistenceController.shared.container.viewContext)
                _res.append(TerpeneJSON(name: terpene.name!, description: terpene.desc!, aromas: self.convertCoreDataAromasToAromaEffect(aromas: Array(terpene.aromas!)), effects: self.convertCoreDataEffectsToAromaEffect(effects: Array(terpene.effects!)), image: terpene.image!))
                
                
            }
            return _res
        }catch{
            throw TerpeneError.terpeneNotFound
        }
//        return self.loadTerpenes().filter(names.contains({$0.lowercased()==$1.name.lowercased()}))
        
    }
    static func loadTerpeneByName(name: String) -> TerpeneJSON{
        return self.loadTerpenes().filter({$0.name.lowercased()==name.lowercased()}).first!
        
    }

//    static func convertCoreDataEffectAromaToJSON(effect)
    static func convertCoreDataTerpeneToJSON(terpene: Terpene) -> TerpeneJSON{
        var aromas = [EffectAromaJSON]()
        var effects = [EffectAromaJSON]()
        if terpene.aromas != nil{
//            var _aromas = []
            terpene.aromas!.forEach(){ aroma in
                aromas.append(EffectAromaJSON(id: aroma.id!, name: aroma.name!, description: aroma.desc!, image: aroma.image!))
            }
        }
        if terpene.effects != nil{
//            var _aromas = []
            terpene.effects!.forEach(){ effect in
                effects.append(EffectAromaJSON(id: effect.id!, name: effect.name!, description: effect.desc!, image: effect.image!))
            }
        }
        
        return TerpeneJSON(name: terpene.name!, description: terpene.desc!, aromas: aromas, effects: effects, image: terpene.image!)
    }
    static func loadTerpenesByEffectAroma(effectAroma: EffectAromaJSON) -> [TerpeneJSON]
    {
//        v
        var _res = [TerpeneJSON]()
        do {
            let aroma = try TerpeneCoreDataUtil.loadAromaByName(name: effectAroma.name, viewContext: PersistenceController.shared.container.viewContext)
            if aroma.terpenes != nil {
                for i in (0..<aroma.terpenes!.count){
                    let terpene = Array(aroma.terpenes!)[i]
                    _res.append(self.convertCoreDataTerpeneToJSON(terpene: terpene))
//                    _res.append(TerpeneJSON(name: terpene.name!, description: terpene.desc!, aromas: self.convertCoreDataAromasToAromaEffect(aromas: terpene.aromas != nil ? Array(terpene.aromas!): [EffectAromaJSON]()), effects: self.convertCoreDataEffectsToAromaEffect(effects: terpene.effects != nil ? Array(terpene.effects!) : [EffectAromaJSON]()), image: terpene.image!))
                }
            }
        }catch{
            print("Effect/Aroma: \(effectAroma.name) not found as aroma")
        }
        
        do {
            let effect = try TerpeneCoreDataUtil.loadEffectByName(name: effectAroma.name, viewContext: PersistenceController.shared.container.viewContext)
            if effect.terpenes != nil {
                for i in (0..<effect.terpenes!.count){
//                effect.terpenes!.forEach(){ terpene in
                    let terpene = Array(effect.terpenes!)[i]
                    _res.append(TerpeneJSON(name: terpene.name!, description: terpene.desc!, aromas: self.convertCoreDataAromasToAromaEffect(aromas: Array(terpene.aromas!)), effects: self.convertCoreDataEffectsToAromaEffect(effects: Array(terpene.effects!)), image: terpene.image!))
                }
            }
        }catch{
            print("Effect/Aroma: \(effectAroma.name) not found as effect")
        }
        
        return _res
//        terpenes.forEach { terpene in
//            if !_res.contains(terpene) && terpene.effects.contains(where: {effect.lowercased() == $0.name.lowercased()}){
//                _res.append(terpene)
//            }
//        }
//        return _res.sorted {
//            $0.name < $1.name
//        }
    }
    static func loadTerpenesByEffect(effect: String, terpenes: [TerpeneJSON]) -> [TerpeneJSON]
    {
        var _res = [TerpeneJSON]()
        terpenes.forEach { terpene in
            if !_res.contains(terpene) && terpene.effects.contains(where: {effect.lowercased() == $0.name.lowercased()}){
                _res.append(terpene)
            }
        }
        return _res.sorted {
            $0.name < $1.name
        }
    }
    static func loadAromaJSON()->[EffectAromaJSON]{
        var _res = [EffectAromaJSON]()
        self.loadTerpenes().forEach { terpene in
            terpene.aromas.forEach { aroma in
                if !_res.contains(where: {$0.name.lowercased() == aroma.name.lowercased()}){
                    _res.append(aroma)
                }
            }
        }
        //        }
        return _res.sorted {
            $0.name < $1.name
            
        }
    }
    
    static func loadEffectJSON()->[EffectAromaJSON]{
        var _res = [EffectAromaJSON]()
        self.loadTerpenes().forEach { terpene in
            terpene.effects.forEach { effect in
                if !_res.contains(where: {$0.name.lowercased() == effect .name.lowercased()}){
                    _res.append(effect )
                }
            }
        }
        //        }
        return _res.sorted {
            $0.name < $1.name
            
        }
    }
    

   
                                  
                                


                                  
                                  
    static func loadAromas()->[String]{
        var _res = [String]()
        self.loadTerpenes().forEach { terpene in
            terpene.aromas.forEach { aroma in
                if !_res.contains(aroma.name){
                    _res.append(aroma.name)
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
                if !_res.contains(effect.name){
                    _res.append(effect.name)
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
                if !_res.contains(aroma.name){
                    _res.append(aroma.name)
                }
            }
        }
//        }
        return _res.sorted {
            $0 < $1
        }
    }
    static func loadTerpeneAromasDataMap(terpenes: [TerpeneJSON])->[DataMap]{
        var _res = [DataMap]()
        self.loadTerpeneAromas(terpenes: terpenes).forEach { aroma in
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
                if !_res.contains(effect.name){
                    _res.append(effect.name)
                }
            }
        }
//        }
        return _res.sorted {
            $0 < $1
        }
    }
    static func loadTerpeneEffectsDataMap(terpenes: [TerpeneJSON])->[DataMap]{
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
            _terpenes.append(DataMap(key: $0.name, value: $0.description, view: TerpeneDetailView(terpene: $0),image: $0.image))
        }
        return _terpenes.sorted {
            $0.key < $1.value
        }
    }
    static func loadEffectDataMap(terpenes: [TerpeneJSON], strains: [StrainJSON]) -> [DataMap]{
        var _effects = [DataMap]()
        TerpeneJSONUtil.loadTerpeneEffects(terpenes: terpenes).forEach { effect in
            _effects.append(DataMap(key: effect, value: "", view: ListView(data: StrainJSONUtil.loadStrainDataMap(strains: StrainJSONUtil.loadStrainsByTerpenes(terpenes: TerpeneJSONUtil.loadTerpenesByEffect(effect: effect, terpenes: terpenes), strains: strains)), searchTitle: "Strains With \(effect) Effects")))
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
    static func loadAromaEffectDataMap(data: [EffectAromaJSON])-> [DataMap]{
        var _res = [DataMap]()
        data.forEach(){ ae in
            _res.append(DataMap(key: ae.name, value: ae.description, view: TerpeneEffectAromaView(effectAroma: ae), image: ae.image))
            
        }
        return _res
    }

    static func loadAromaEffectDataMap(data: [String])-> [DataMap]{
        var _res = [DataMap]()
        data.forEach(){ ae in
            _res.append(DataMap(key: ae, value: DictionaryUtil.loadDescription(text: ae), view: TerpeneEffectAromaView(effectAroma: EffectAromaJSON(id: "1111111", name: ae, description: ae, image: ""))))
            
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
    static func loadAromaDataMap(terpenes: [TerpeneJSON], strains: [StrainJSON]) -> [DataMap]{
        var _aromas = [DataMap]()
        TerpeneJSONUtil.loadTerpeneAromas(terpenes: terpenes).forEach { aroma in
            _aromas.append(DataMap(key: aroma, value: "", view: ListView(data: StrainJSONUtil.loadStrainDataMap(strains: StrainJSONUtil.loadStrainsByTerpenes(terpenes: TerpeneJSONUtil.loadTerpenesByAroma(aroma: aroma, terpenes: terpenes), strains: strains)), searchTitle: "Strains With \(aroma) Aromas`")))
        }
//        var _effect = [DataMap]()
//        terpenes.forEach { terpene in
//
//        }
        return _aromas.sorted {
            $0.key < $1.value
        }
    }
    
}
