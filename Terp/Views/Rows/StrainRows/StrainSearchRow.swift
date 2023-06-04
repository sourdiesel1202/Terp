//
//  StrainSearchRow.swift
//  Flowr
//
//  Created by Andrew on 5/4/23.
//

import SwiftUI

struct StrainSearchRow: View {
    let strain: Strain
    let colors: [String: Color] = ["Indica": .blue, "Sativa": .red, "Hybrid": .green]
    var body: some View {
        HStack {
            CircleText(text: strain.type.uppercased(), color: .blue)
//            Image(systemName: "flower").resizable()
//                                    .aspectRatio(contentMode: .fit)
//                                    .frame(maxWidth: 150, maxHeight:75).clipShape(Circle()).overlay(Circle().stroke(colors[strain.type, default: .green], lineWidth: 2))
//            AsyncImage(
//                url: URL(string: strain.image),
//                content: { image in
//                    image.resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: 150, maxHeight:75).clipShape(Circle()).overlay(Circle().stroke(colors[strain.type, default: .green], lineWidth: 2))
//                },
//                placeholder: {
//                    ProgressView()
//                }
//            )
            VStack(alignment: .leading) {
                Text(strain.name)
                    .font(.subheadline).fontWeight(.bold)
                
                HStack{
                    Text("Terpenes:").font(.caption2)
//                    ForEach(self.strain.terpenes, id: \.self){ terpene in
                    Text(strain.terpenes.joined(separator: ",")).font(.caption2)
//                    }
                }
                HStack{
                    Text("Type:").font(.caption2)
                    Text(strain.type).font(.caption2)
                }
//                Text("$\(item.price)")
            }
            Spacer()
            VStack{
                
            }
//            Text(strain.type.uppercased().prefix(1)).font(.caption)
//                .fontWeight(.black)
//                .padding(5)
//                .background(colors[strain.type, default: .black])
//                .clipShape(Circle())
//                .foregroundColor(.white)

//            ForEach(item.restrictions, id: \.self) { restriction in
//                Text(restriction)
//
//            }

            }
    }
}

struct StrainSearchRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainSearchRow(strain: Strain.example)
    }
}
