//
//  HorizontalTerpeneEffectAromaRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct HorizontalTerpeneEffectAromaRow: View {
    let data: [AromaEffectJSON]
    private var limit: Int {
        return self.data.count > 3 ? 3: self.data.count
    }
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .top){
                
                ForEach(self.data[0..<self.limit], id: \.self){ (item:AromaEffectJSON) in
                    Button(action: {}){
                        NavigationLink {
                            TerpeneEffectAromaView(effectAroma: item)
//                            Terpene(name: <#T##String#>, description: <#T##String#>, aromas: <#T##[String]#>, effects: <#T##[String]#>)
//                            StrainDetail2_0View(strain: strain)
                        }label: {
                            VStack{
//                                URLImage(url: strain.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                CircleText(text: item.name, color: .blue)
                                Text(item.name).font(.caption).fontWeight(.bold)
                                
                            }.padding([.trailing])
                        }
                    }
                    
                    
                }
                if self.data.count > 3{
                    Button(action: {}){
                        NavigationLink{
                            ThumbnailListView(data: TerpeneJSONUtil.loadAromaEffectDataMap(data: self.data), searchTitle: "Effects")
                        }label: {
                            VStack{
                                Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.blue)
                                Text("View All").font(.caption2).fontWeight(.bold)
                                
                            }
                        }
                    }.padding([.leading,.trailing])
                }
            }.padding([.leading,.trailing,.bottom])
            //            }
            
        
        }
    }
}

struct HorizontalTerpeneEffectAromaRow_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalTerpeneEffectAromaRow(data: [AromaEffectJSON.example])
    }
}
