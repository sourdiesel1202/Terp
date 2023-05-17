//
//  DataMap.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import Foundation
import SwiftUI
struct DataMap: Hashable, Identifiable, Equatable
{
    static func == (lhs: DataMap, rhs: DataMap) -> Bool {
        return lhs.id==rhs.id && lhs.key==rhs.key && lhs.value==rhs.value
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
    }
    
//    static func == (lhs: DataMap<T>, rhs: DataMap<T>) -> Bool {
        
//    }
    
    enum CodingKeys: CodingKey{
        case id
        case key
        case value
//        case view
    }
    var id = UUID()
    var key: String
    var value: String
    var view: any View
    
//    init(@ViewBuilder view: () -> T){
//        self.view = view()
//    }
//    var body: some View{}
    

#if DEBUG
    static let example = DataMap(id: UUID(), key: "Fuck",value: "A duck", view: ContentView())
#endif
}
//
