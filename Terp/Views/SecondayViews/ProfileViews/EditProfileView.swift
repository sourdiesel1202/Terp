//
//  EditProfileView.swift
//  Terp
//
//  Created by Andrew on 6/12/23.
//

import SwiftUI
import PhotosUI
struct EditProfileView: View {
    @State var user: User
    @State var showFilters: Bool = false
    @State private var newProfilePicture: UIImage? = nil
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var bio: String = ""
    @State private var location : Location = Location.example
    
    //    @State private var
    var body: some View {
        //        VStack(alignment: ){
        ScrollView(.vertical){
            VStack(alignment: .center){
                
                
                //                Section(header:Text("Edit Profile")){
                HStack{
                    if self.newProfilePicture != nil{
                        Image(uiImage: self.newProfilePicture!).resizable().frame(width: 200, height: 200).clipShape(Circle()).scaledToFill()
                    }else{
                        UserImageThumbnail(user: self.user).frame(width: 200, height: 200).scaledToFill()
                        //                    URLImage(url: <#T##String#>, shape: <#T##AnyShape#>)
                    }
                }.padding([.bottom])
                //this is annoying, but i can't seem to send the binding deep enough to make it work
                ChooseTakePhotoView(newImage: self.$newProfilePicture, showFilters: self.$showFilters).fullScreenCover(isPresented: self.$showFilters, content: {
                    FilterSelectionView(image: self.$newProfilePicture, displaying: self.$showFilters)
                })
                //            Form{
                
                EditProfileUserInfoRow(user: self.$user)
                EditProfileLocationRow(user: self.$user, selectedCountry: self.$location.country, selectedState: self.$location.state, selectedCity: self.$location.city)
                FullWidthButton(text: "Save", action: {
                    print("Data saved")
                }).padding([.leading,.trailing])
            }.onAppear{
                self.firstName = self.user.firstname
                self.lastName = self.user.lastname
                self.bio = self.user.bio
                self.location = self.user.location
            }
            
        }
            
            
//        }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
//        .listRowInsets(EdgeInsets())
//        .background(Color(UIColor.lightGray))
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.example)
    }
}
