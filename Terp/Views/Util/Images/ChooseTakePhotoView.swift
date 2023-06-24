//
//  ChooseTakePhotoView.swift
//  Terp
//
//  Created by Andrew on 6/20/23.
//

import SwiftUI
import PhotosUI

struct ChooseTakePhotoView: View {
    
//    @State var newImage: UIImage?
    @State var newImage: Binding<UIImage?>
    @State var showFilters: Binding<Bool>
    @State private var selectedItem: PhotosPickerItem? = nil
    @State var showSelection: Bool = false
    @State var showPicker: Bool = false
    
    @State var type: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack(alignment: .center){
            
            
            
            FullWidthButton(text: self.newImage.wrappedValue == nil ? "Add Photo" : "Change Photo", action: {
                self.showSelection = true
            }).padding([.leading,.trailing])
            
            
            
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
        }.fullScreenCover(isPresented: $showPicker) {
                                ImagePickerView(sourceType: self.type ) { image in
                                    self.newImage.wrappedValue = image
                                    self.showFilters.wrappedValue.toggle()
                                }
                            }
    }
}

struct ChooseTakePhotoView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTakePhotoView(newImage: .constant(UIImage()), showFilters: .constant(false))
    }
}
