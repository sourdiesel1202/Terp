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
    
    static func loadCoutries()-> [LocationCountry]{
        var countries = [LocationCountry]()
        self.loadLocations().forEach(){loc in
            if !countries.contains(where: {$0.name == loc.country.name}){
                countries.append(loc.country)
            }
        }
        return countries
    }
    static func loadStates() -> [LocationState]{
        var states = [LocationState]()
        self.loadLocations().forEach(){loc in
            if !states.contains(where: {$0.name == loc.country.name}){
                states.append(loc.state)
            }
        }
        return states
    }
    static func loadStatesByCountry(country: LocationCountry)-> [LocationState]{
        var states = [LocationState]()
        self.loadLocations().forEach(){loc in
            if loc.country.name == country.name{
                if !states.contains(where: {$0.name == loc.state.name}){
                    states.append(loc.state)
                }
            }
        }
        return states
    }
    static func loadCitiesByState(locState: LocationState)-> [LocationCity]{
        var cities = [LocationCity]()
        self.loadLocations().forEach(){loc in
            if loc.state.name == locState.name{
                if !cities.contains(where: {$0.name == loc.city.name}){
                    cities.append(loc.city)
                }
            }
        }
        return cities
    }
//    static func loadCitiesByState(){
        
//    }
}
