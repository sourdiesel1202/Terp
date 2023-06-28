//
//  HashTagText.swift
//  Terp
//
//  Created by Andrew on 6/27/23.
//

import SwiftUI

struct HashTagText: View {
    let inputString: String
    var body: some View {
        VStack{
//            HStack{
//                Text(self.inputString)
//            }
            HStack{
                ForEach(self.inputString.components(separatedBy: " "), id: \.self){ str in
                    
                    if str.prefix(1).contains("#")
                    {
                        Button(action: {}){
                            NavigationLink{
                                SearchView(searchText: str)
                            }label: {
                                
                                Text(str.replacing(" ", with: "")).foregroundColor(.blue)
                            }
                        }
                    }else{
                        Text(str.replacing(" ", with: ""))
                    }
                }
            }
            
        }
    }
}

struct HashTagText_Previews: PreviewProvider {
    static var previews: some View {
        HashTagText(inputString: "Fuck This shit #fubar")
    }
}
