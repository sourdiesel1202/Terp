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
                var _aromas = [String]()
                var _effects = [String]()
                terp.aromas!.forEach(){ (aroma: Aroma) in
                    _aromas.append(aroma.name!)
                }
                terp.effects!.forEach(){ effect in
                    _effects.append(effect.name!)
                }
                terpenes.append(TerpeneJSON(name: terp.name!, description: terp.desc!, aromas: _aromas, effects: _effects))
            }
        } catch let error as NSError{
            print("could not load terpenes from core data \(error.userInfo): \(error)")
        }
        print("Terpenes in core data \(terpenes.count)")
        // ok so the idea here is basically that if CD is empty we need to return from json. not ideal, but it works
        if terpenes.count == 0 {
            return Bundle.main.decode([TerpeneJSON].self, from: "terpene.json")
        }else{
            return terpenes
        }
//        return terpenes
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
        TerpeneJSONUtil.loadTerpeneEffects(terpenes: terpenes).forEach { effect in
            _effects.append(DataMap(key: effect, value: "", view: ListView(data: StrainUtil.loadStrainDataMap(strains: StrainUtil.loadStrainsByTerpenes(terpenes: TerpeneJSONUtil.loadTerpenesByEffect(effect: effect, terpenes: terpenes), strains: strains)), searchTitle: "Strains With \(effect) Effects")))
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
        TerpeneJSONUtil.loadTerpeneAromas(terpenes: terpenes).forEach { aroma in
            _aromas.append(DataMap(key: aroma, value: "", view: ListView(data: StrainUtil.loadStrainDataMap(strains: StrainUtil.loadStrainsByTerpenes(terpenes: TerpeneJSONUtil.loadTerpenesByAroma(aroma: aroma, terpenes: terpenes), strains: strains)), searchTitle: "Strains With \(aroma) Aromas`")))
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
