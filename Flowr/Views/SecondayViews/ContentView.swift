//
//  ContentView.swift
//  Flowr
//
//  Created by Andrew on 4/28/23.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    let data = Bundle.main.decode([Strain].self, from: "strain_data.json")

    var body: some View {
        
        Text("Hello")
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
