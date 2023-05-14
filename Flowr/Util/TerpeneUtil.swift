//
//  TerpeneUtil.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import Foundation
//import SwiftUI
struct TerpeneUtil{
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
        return _res
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
        return _res
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
        return _res
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
        return _res
    }
}
