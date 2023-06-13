//
//  LocationUtil.swift
//  Terp
//
//  Created by Andrew on 6/11/23.
//

import Foundation
struct LocationUtil {
    static func loadLocations() -> [Location]  {
        return Bundle.main.decode([Location].self, from: "locations.json")
    }
    static func loadLocationByCity(city: String) -> Location{
        return self.loadLocations().filter({$0.city.name.lowercased() == city.lowercased()}).first!
    }
    
}
