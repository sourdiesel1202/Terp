//
//  HorizontalStrainList.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct HorizontalStrainListRow: View {
    let strains: [StrainJSON]
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .top){
                if self.strains.count > 3 {
                    ForEach(self.strains[0...3]){ (strain:StrainJSON) in
                        Button(action: {}){
                            NavigationLink {
                                StrainDetail2_0View(strain: strain)
                            }label: {
                                VStack{
                                    URLImage(url: strain.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                    
                                    Text(strain.name).font(.caption).fontWeight(.bold)
                                    
                                }.padding([.trailing])
                            }
                        }
                        
                    }
                }else{
                    ForEach(self.strains[0..<self.strains.count]){ (strain:StrainJSON) in
                        Button(action: {}){
                            NavigationLink {
                                StrainDetail2_0View(strain: strain)
                            }label: {
                                VStack{
                                    URLImage(url: strain.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                    
                                    Text(strain.name).font(.caption).fontWeight(.bold)
                                    
                                }.padding([.trailing])
                            }
                        }
                        
                    }
                }
                
                
                if self.strains.count > 3{
                    Button(action: {}){
                        NavigationLink{
                            ThumbnailListView(data: StrainJSONUtil.loadStrainDataMap(strains: self.strains), searchTitle: "Strains")
//                            StrainDetailView(strain: <#T##Strain#>)
                        }label: {
                            VStack{
                                Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.gray)
                                Text("View All").font(.caption2).fontWeight(.bold).foregroundColor(.gray)
                                
                            }
                        }
                    }.padding([.leading,.trailing])
                }
            }.padding([.leading,.trailing,.bottom])
            //            }
            
        }
    }
}

struct HorizontalStrainListRow_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalStrainListRow(strains: [StrainJSON.example, StrainJSON.example, StrainJSON.example, StrainJSON.example])
    }
}
