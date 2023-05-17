//
//  GlobalData.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import Foundation
class GlobalData: ObservableObject{
    @Published var strains = Bundle.main.decode([Strain].self, from: "strain_data.json")
    @Published var terpenes = Bundle.main.decode([Terpene].self, from: "terpene.json")
    @Published var terpeneProfile = Bundle.main.decode(TerpeneProfile.self, from: "terpene_profile.json")
}
 
