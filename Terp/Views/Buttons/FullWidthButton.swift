//
//  FullWidthButton.swift
//  Flowr
//
//  Created by Andrew on 5/16/23.
//

import SwiftUI

struct FullWidthButton: View {
    var text: String
    var action: () -> Void
    var destination: AnyView?
    var body: some View {
        
        if self.destination != nil{
            NavigationStack{
                NavigationLink{
                    AnyView(self.destination)
                }label: {
                    Button(action: action){
                        
                        Text(self.text).frame(maxWidth: .infinity).font(.headline).fontWeight(.bold).padding().background(.blue)
                            .foregroundColor(.white)
                            .clipShape(
                                
                                // 2
                                Capsule()
                            )
                    }
                }
            }
        }else{
            Button(action: self.action){
                Text(self.text).frame(maxWidth: .infinity).font(.headline).fontWeight(.bold).padding().background(.blue)
                    .foregroundColor(.white)
                    .clipShape(
                        
                        // 2
                        Capsule()
                    )
            }
        }
        
        
    }
}

struct FullWidthButton_Previews: PreviewProvider {
    static var previews: some View {
        FullWidthButton(text: "Button",action: {})
    }
}
