//
//  StrainRatePhotoRow.swift
//  Terp
//
//  Created by Andrew on 6/13/23.
//

import SwiftUI
import PhotosUI

struct StrainRatePhotoRow: View {
    @State var image: UIImage?
    @State private var selectedItem: PhotosPickerItem? = nil
    @State var showSelection: Bool = false
    @State var showPicker: Bool = false
    @State var showFilters: Bool = false
    @State var showConfirmRemove: Bool = false
    @State var type: UIImagePickerController.SourceType = .photoLibrary
    
    var body: some View {
        VStack{
            if self.image != nil {
                Button(action: {
                    self.showConfirmRemove = true
//                    self.image = nil
                }){
                    Image(uiImage: self.image!).resizable().scaledToFit().padding()
                }
                
            }
        }
        FullWidthButton(text: self.image == nil ? "Add Photo" : "Change Photo", action: {
            self.showSelection = true
        }).padding()
//        Button( self.image == nil ? "Add Photo" : "Change Photo" ){
//
//        }
        
        
        
    
    .confirmationDialog("Choose strain picture",
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
                            ImagePickerView(sourceType: self.type ) { img in
                                self.image = img
                                self.showFilters = true
                            }
                        }.fullScreenCover(isPresented: self.$showFilters, content: {
                            FilterSelectionView(image: self.$image, displaying: self.$showFilters)
                        }).confirmationDialog("Are you sure?", isPresented: self.$showConfirmRemove){
                            Button("Remove photo", role:.destructive){
                                self.image = nil
                                self.showConfirmRemove = false
                            }
                        }
    
    }
}

struct StrainRatePhotoRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainRatePhotoRow(image: UIImage(systemName: "person.fill"))
    }
}
