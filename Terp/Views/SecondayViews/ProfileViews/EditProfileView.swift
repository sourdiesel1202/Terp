//
//  EditProfileView.swift
//  Terp
//
//  Created by Andrew on 6/12/23.
//

import SwiftUI
import PhotosUI
struct EditProfileView: View {
    let user: User
    @State private var selectedItem: PhotosPickerItem? = nil
    @State var showSelection: Bool = false
    @State var showPicker: Bool = false
    @State var showFilters: Bool = false
    @State var type: UIImagePickerController.SourceType = .photoLibrary
    @State private var newProfilePicture: UIImage? = nil
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var bio: String = ""
    @State private var location : Location = Location.example
    
    //    @State private var
    var body: some View {
        //        VStack(alignment: ){
        if self.newProfilePicture != nil{
            Image(uiImage: self.newProfilePicture!).resizable().frame(width: 200, height: 200).clipShape(Circle())
        }else{
            UserImageThumbnail(user: self.user).frame(width: 200, height: 200)
            //                    URLImage(url: <#T##String#>, shape: <#T##AnyShape#>)
        }
        Form{
            Section(header:Text("Edit Profile")){
                VStack(alignment: .center){
                    
                    
                    
                    Button("Change Profile Photo"){
                        self.showSelection = true
                    }
                    
                    
                    
                }
                .confirmationDialog("Choose profile picture",
                                    isPresented: $showSelection,
                                    titleVisibility: .hidden) {
                    
                    Button("Take Photo") {
                        showPicker = true
                        type = .camera
                    }
                    
                    Button("Upload Existing") {
                        showPicker = true
                        type = .photoLibrary
                        
                    }
                }
                                    .fullScreenCover(isPresented: $showPicker) {
                                        ImagePickerView(sourceType: self.type ) { image in
                                            self.newProfilePicture = image
                                            self.showFilters = true
                                        }
                                    }
                
                VStack(alignment: .leading){
                    
                    HStack {
                        Text("First Name").padding([.leading])
                        TextField("", text: self.$firstName).multilineTextAlignment(.leading).padding([.leading,.trailing])
                        //                Spacer()
                    }
                    HStack {
                        Text("Last Name").padding([.leading])
                        TextField("", text: self.$lastName).multilineTextAlignment(.leading).padding([.leading,.trailing])
                        //                Spacer()
                    }
                    HStack {
                        Text("Bio").padding([.leading])
                        TextField("", text: self.$bio).multilineTextAlignment(.leading).padding([.leading,.trailing])
                        //                Spacer()
                    }
                }
            }.onAppear{
                self.firstName = self.user.firstname
                self.lastName = self.user.lastname
                self.bio = self.user.bio
                self.location = self.user.location
            }.fullScreenCover(isPresented: self.$showFilters, content: {
                FilterSelectionView(image: self.$newProfilePicture, displaying: self.$showFilters)
            })
            
        }
    }
    }

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: User.example)
    }
}
