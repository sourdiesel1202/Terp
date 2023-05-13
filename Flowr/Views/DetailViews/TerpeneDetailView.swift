//
//  TerpeneDetailView.swift
//  Flowr
//
//  Created by Andrew on 5/12/23.
//

import SwiftUI

struct TerpeneDetailView: View {
    let terpene: Terpene
    var body: some View {
        VStack (alignment: .center){
            Image(systemName: "atom").padding()
            Text(terpene.name).font(.title).padding(.bottom)
            Text(terpene.description).font(.subheadline)
            //todo add list of strains with this terepene
            NavigationStack {List {
                //            ForEach(data) {(strain: Strain) in
                NavigationLink {
                    StrainListView(data: Bundle.main.searchStrainByTerpene(terpene: terpene))
                } label: {
                    
                    BasicRow(title: "Strains Containing \(terpene.name)", description: "Discover strains containing \(terpene.name)")
                    //                    StrainSearchRow(strain: strain)
                }
                
                NavigationLink {
                    StrainListView(data: Bundle.main.searchStrainByTerpene(terpene: terpene))
                } label: {
                    BasicRow(title: "View Effects", description: "Discover the effects of \(terpene.name)")
                    //                    StrainSearchRow(strain: strain)
                }
                
                NavigationLink {
                    RecommendedStrainsView()
                } label: {
                    BasicRow(title: "View Aromas", description: "Explore the aromas of \(terpene.name)")
                    //                    StrainSearchRow(strain: strain)
                }
                //            }
            }.navigationTitle("More").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
            }
        }
    }
}

struct TerpeneDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneDetailView(terpene: Terpene.example)
    }
}
