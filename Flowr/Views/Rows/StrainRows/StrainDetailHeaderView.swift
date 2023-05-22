//
//  StrainDetailHeaderView.swift
//  Flowr
//
//  Created by Andrew on 5/19/23.
//

import SwiftUI

struct StrainDetailHeaderView: View {
    let strain: Strain
    var body: some View {
        VStack (alignment: .center){
            AsyncImage(
                url: URL(string: strain.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 300, maxHeight: 100)
                },
                placeholder: {
                    ProgressView()
                }
            ).clipShape(Circle())
            Text(strain.description)
                .padding()
            
        }
    }
}

struct StrainDetailHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StrainDetailHeaderView(strain: Strain.example)
    }
}
