//
//  StrainDetailHeaderView.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct StrainDetailHeaderRow: View {
    let strain: Strain
    var body: some View {
        Text(strain.name).fontWeight(.bold).font(.title).padding([.top, .bottom])
        VStack (alignment: .center){
            AsyncImage(
                url: URL(string: strain.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit).scaledToFit()
                    //                                .frame(maxWidth: 400, maxHeight: 200)
                },
                placeholder: {
                    ProgressView()
                }
            ).clipShape(Circle())
            
            
        }
        VStack(alignment: .leading){
            //                    ViewDivider(height: 0.25)
            
            //                    ViewDivider(height: 0.5)
            Text(strain.description)
                .padding()
        }
    }
}

struct StrainDetailHeaderRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailHeaderRow(strain: Strain.example)
    }
}
