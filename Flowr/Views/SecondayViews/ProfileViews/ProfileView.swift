//
//  ProfileView.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    var body: some View {
        ScrollView(.vertical){
            VStack(alignment: .center){
                
                
                
                        Image(systemName: "person.circle").resizable().scaledToFit().clipped().frame(width: 200, height: 200)
                        Text(user.username)
                HStack{
                    Text("Reviews").foregroundColor(.gray).padding(.leading)
                    Spacer()
                }
                
                ForEach(1..<5 + 1, id: \.self) { number in
                    
                    Button(action: {}){
                            NavigationLink{
                                ContentView()
                            }label: {
                                
                                HStack{
                                    VStack{
                                        Text("Title")
                                        Text("")
                                    }
                                    Spacer()
                                    
                                }
                                //                                BasicRow(title: "OG Kush", description: "5 stars")
                                
                            }
                    }
                
                }
                    
                HStack{
                    Text("Terpene Profile").foregroundColor(.gray).padding(.leading)
                    Spacer()
                }
                
                    FullWidthButton(text: "View Terpene Profile", action: {})
                
                
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.example)
    }
}
