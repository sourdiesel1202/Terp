//
//  EditProfileUserInfoRow.swift
//  Terp
//
//  Created by Andrew on 6/20/23.
//

import SwiftUI

struct EditProfileUserInfoRow: View {
    let user: Binding<User>
//    @Stat
    var body: some View {
        VStack(alignment: .center){
            Text("Info").font(.title).fontWeight(.bold)
        }.padding(.top)
        VStack(alignment: .leading){
            
            HStack {
                Text("First Name").fontWeight(.bold)
                TextField("", text: self.user.firstname).multilineTextAlignment(.leading).padding([.leading,.trailing])
                //                Spacer()
            }.padding([.top,.leading])
            HStack {
                Text("Last Name").fontWeight(.bold)
                TextField("", text: self.user.lastname).multilineTextAlignment(.leading).padding([.leading,.trailing])
                //                Spacer()
            }.padding([.top,.leading])
            HStack {
                Text("Bio").fontWeight(.bold)
                TextField("", text: self.user.bio, axis: .vertical).multilineTextAlignment(.leading).padding([.leading,.trailing]).lineLimit(8, reservesSpace: true).textFieldStyle(.roundedBorder)
                //                Spacer()
            }.padding([.leading])
        }.padding()
    }
}

struct EditProfileUserInfoRow_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileUserInfoRow(user: .constant(User.example))
    }
}
