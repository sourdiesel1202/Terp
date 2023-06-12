//
//  Location.swift
//  Terp
//
//  Created by Andrew on 6/11/23.
//

import Foundation
struct LocationCountry: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case id
        case name
        case emoji
        case code
    
    }
    var id: String
    var name: String
    var emoji: String

    var code: String
//    #if DEBUG
//    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
//    #endif
    
#if DEBUG
    static let example = LocationCountry(id: "1234", name: "Canada", emoji: "🇨🇦", code: "CA")
#endif
}

struct LocationState: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case id
        case name
        case code
    
    }
    var id: String
    var name: String
    var code: String
    
#if DEBUG
    static let example = LocationState(id: "1234", name: "Ontario", code: "ON")
#endif
}

struct LocationCity: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case id
        case name
        case longitude
        case latitude
    
    }
    var id: String
    var name: String
    var longitude: String
    var latitude: String
    
#if DEBUG
    static let example = LocationCity(id: "1234", name: "Ontario", longitude: "", latitude: "")
#endif
}


struct Location: Codable, Identifiable, Hashable{
//    var name: String
    enum CodingKeys: CodingKey{
//        var id = UUID()
//        case url
        case id
        case country
        case state
//        case description
        case city
//        case requires
    
    }
    var id: String
    var country: LocationCountry
    var state: LocationState

    var city: LocationCity
//    #if DEBUG
//    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
//    #endif
    
#if DEBUG
    static let example = Location(id: "1234", country: LocationCountry.example, state: LocationState.example, city: LocationCity.example)
#endif
}
