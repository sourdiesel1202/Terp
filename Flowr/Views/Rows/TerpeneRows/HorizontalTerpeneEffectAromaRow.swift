//
//  HorizontalTerpeneEffectAromaRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct HorizontalTerpeneEffectAromaRow: View {
    let data: [String]
    var body: some View {
        ScrollView(.horizontal){
            HStack(alignment: .top){
                
                ForEach(self.data[0...3], id: \.self){ (item:String) in
                    Button(action: {}){
                        NavigationLink {
                            TerpeneEffectAromaView(title: item, description: DictionaryUtil.loadDescription(text: item))
//                            Terpene(name: <#T##String#>, description: <#T##String#>, aromas: <#T##[String]#>, effects: <#T##[String]#>)
//                            StrainDetail2_0View(strain: strain)
                        }label: {
                            VStack{
//                                URLImage(url: strain.image, shape: AnyShape(Circle())).frame(width: 75, height: 75).frame(maxWidth: .infinity)
                                CircleText(text: item, color: .blue)
                                Text(item).font(.caption).fontWeight(.bold)
                                
                            }.padding([.trailing])
                        }
                    }
                    
                    
                }
                if self.data.count > 3{
                    Button(action: {}){
                        VStack{
                            Image(systemName: "ellipsis").resizable().scaledToFit().frame(width: 75, height: 75).frame(maxWidth: .infinity).foregroundColor(.blue)
                            Text("View All").font(.caption2).fontWeight(.bold)
                            
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
        HorizontalTerpeneEffectAromaRow(data: ["Apples", "Butthole", "Earthy", "Grape"])
    }
}
