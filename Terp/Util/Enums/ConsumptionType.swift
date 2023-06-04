//
//  ConsumptionType.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import Foundation
enum ConsumptionType: CaseIterable, Identifiable{
    case flower
    case concentrates
    case hashish
    case edibles
    var id: Self { self }
    var description: String {
        
        switch self {
        case .flower:
            return "Flower"
        case .concentrates:
            return "Concentrates"
        case .edibles:
            return "Edibles"
        case .hashish:
            return "Hash"
        }
    }
}
