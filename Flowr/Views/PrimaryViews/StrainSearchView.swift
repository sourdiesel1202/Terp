//
//  SearchResult.swift
//  Flowr
//
//  Created by Andrew on 4/30/23.
//

import SwiftUI

struct StrainSearchView: View {
    @State private var searchText = ""
    
    let data = Bundle.main.decode([Strain].self, from: "strain_data.json")

    var body: some View {
        
        StrainListView(data: data)
    }

}

struct StrainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        StrainSearchView()
    }
}
