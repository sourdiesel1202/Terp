//
//  AromaJSON.swift
//  Terp
//
//  Created by Andrew on 6/14/23.
//

import Foundation
struct EffectAromaJSON: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case id
        case name
        case description
//        case description
        case image
//        case requires
    
    }
    var id: String
    var name: String
    var description: String

    var image: String
    
#if DEBUG
    static let example = EffectAromaJSON(id: "1234", name: "Butthole", description: "The delicious smell of buttholes; Fresh butthole in the morning", image: "https://t4.ftcdn.net/jpg/02/97/35/93/360_F_297359303_TcVumdikGci1F7uhYEPnhfOe8FUt4JnO.jpg")
#endif
}
