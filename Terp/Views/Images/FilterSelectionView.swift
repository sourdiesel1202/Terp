//
//  FilterSelectionView.swift
//  Terp
//
//  Created by Andrew on 6/12/23.
//

import SwiftUI

struct FilterSelectionView: View {
    @State var image: UIImage
    @State private var originalImage: UIImage = UIImage()
    @State private var newImage: UIImage = UIImage()
    var body: some View {
        VStack(alignment: .center){
            Image(uiImage: newImage).resizable().scaledToFit()
            ScrollView(.horizontal){
            HStack{
                Button(action: {
//                    self.image = originalImage
                    self.newImage = originalImage
                }){
                    Image(uiImage:  self.originalImage).resizable().frame(width: 70, height: 90)
                }
                ForEach(ImageUtil.generateFilterPreviews(input: CIImage(image: self.image)!, intensity: 1.0, context: CIContext()), id: \.self){ img in
                        Button(action: {
//                            self.image = img//ImageUtil.applyBuiltInFilter(input: CIImage(image: self.originalImage)!, filter: _filter, intensity: 1.0, context: CIContext())!
                            self.newImage = img
                        }){
//                            Image(uiImage:  ImageUtil.applyBuiltInFilter(input: CIImage(image: self.originalImage)!, filter: _filter, intensity: 1.0, context: CIContext())!)
                                Image(uiImage: img).resizable().frame(width: 70, height: 90)
                        }
                    }
                }
            }
        }.onAppear{
            self.originalImage = self.image
            self.newImage = self.image
        }
    }
}

struct FilterSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FilterSelectionView(image: UIImage(systemName: "person.fill")!)
    }
}
