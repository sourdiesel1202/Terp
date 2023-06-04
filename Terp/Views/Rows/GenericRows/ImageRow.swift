//
//  ImageRow.swift
//  Flowr
//
//  Created by Andrew on 5/15/23.
//

import SwiftUI
struct ImageRow: Row, View {
    var title: String
    var description: String
    var secondaryDescription: String?
    var image: String?
    var body: some View {
        VStack{
            VStack (alignment: .leading){
                HStack(){
                    if self.image != nil{
                        if self.image!.contains("http"){
                            URLImage(url: self.image!, shape: AnyShape(Circle())).frame(width: 90, height: 90)
                        }
                    }else{
                        CircleText(text: self.title, color: .blue)
                    }
                    VStack(alignment: .leading){
                        Text(self.title).fontWeight(.bold)
                        
                        if self.secondaryDescription != nil{
                            Text(self.secondaryDescription!).font(.caption)
                        }
                    }
                    
                }
                
                Text(self.description)
            }
//            VStack(alignment: .leading){
                
//            }
            
            
            
        }
    }
    
}

struct ImageRow_Previews: PreviewProvider {
    static var previews: some View {
        ImageRow(title: "Title", description: "Description", secondaryDescription: "Another line", image: "https://thoughtcatalog.com/wp-content/uploads/2014/05/shutterstock_62349184.jpg?w=1000&h=692&crop=1")
    }
}
