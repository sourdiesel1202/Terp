//
//  StrainSearch.swift
//  Flowr
//
//  Created by Andrew on 5/12/23.
//

import Foundation
extension Bundle{
    func searchStrainByTerpene(terpene: TerpeneJSON)->[StrainJSON]{
        let data = Bundle.main.decode([StrainJSON].self, from: "strain_data.json")
        return data.filter{$0.terpenes.contains(terpene.name)}
//        forEach(<#T##(Element) -> Void#>)
    }
}
