//
//  RecommendedStrainsView.swift
//  Flowr
//
//  Created by Andrew on 5/5/23.
//

import SwiftUI

struct RecommendedStrainsView: View {
    let data = Bundle.main.decode([Strain].self, from: "strain_data.json")
    var body: some View {
                VStack(alignment: .leading){
                    
                    
                    NavigationStack {List {
                        ForEach(data[3...8]) {(strain: Strain) in
                            NavigationLink {
                                StrainDetailView(strain: strain)
                            } label: {
                                
                                StrainSearchRow(strain: strain)
                            }
                        }
                    }.navigationDestination(for: Strain.self) { strain in
                        StrainDetailView(strain: strain)
                        //        }.navigationDestination(for: StrainDetail.self) { strain in
                        //            StrainDetail(strain: (strain: Strain))
                        //        }.navigationTitle("Menu").navigationBarTitleDisplayMode(.inline).listStyle(GroupedListStyle())
                        //            //        .padding()
                    }.toolbar {
                        ToolbarItem(placement: .principal) {
                            VStack {
                                
                                Text("Recommended Strains").font(.headline).padding(.top, 50)
                                
                                Text("Recommended strains based upon your profile")
                            }
                        }
                    }
                        //        .padding()
                    }
                }

    }
}

struct RecommendedStrainsView_Previews: PreviewProvider {
    static var previews: some View {
        RecommendedStrainsView()
    }
}
