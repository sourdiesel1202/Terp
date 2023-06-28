//
//  AccountSettingsView.swift
//  Flowr
//
//  Created by Andrew on 5/11/23.
//

import SwiftUI

struct AccountSettingsView: View {
    var user: User
    
    var body: some View {
        VStack{
            VStack(alignment: .center){
                Text("Info").font(.title).fontWeight(.bold)
            }.padding(.top)
            VStack(alignment: .leading){
                
                HStack {
                    Text("First Name").fontWeight(.bold)
//                    TextField("", text: self.user.firstname).multilineTextAlignment(.leading).padding([.leading,.trailing])
                    //                Spacer()
                }.padding([.top,.leading])
                
            }.padding()
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView(user: User.example)
    }
}
