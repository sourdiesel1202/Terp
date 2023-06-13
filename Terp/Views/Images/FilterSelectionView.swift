//
//  FilterSelectionView.swift
//  Terp
//
//  Created by Andrew on 6/12/23.
//

import SwiftUI

struct FilterSelectionView: View {
    @State var image: Binding<UIImage?>
    @State var displaying: Binding<Bool>
    @State private var originalImage: UIImage = UIImage()
    @State private var newImage: UIImage = UIImage()
    var body: some View {
        VStack(alignment: .center){
            Image(uiImage: newImage).resizable().scaledToFit()
            ScrollView(.horizontal){
            HStack{
                VStack{
                    Text("Original").font(.caption2)
                    Button(action: {
                        //                    self.image = originalImage
                        self.newImage = originalImage
                    }){
                        Image(uiImage:  self.originalImage).resizable().frame(width: 70, height: 90)
                    }
                }
                ForEach(ImageUtil.generateFilterPreviews(input: CIImage(image: self.image.wrappedValue!)!, intensity: 1.0, context: CIContext()), id: \.self){ img in
                    VStack{
                        Text(img.filterName).font(.caption2)
                        Button(action: {
//                            self.image = img//ImageUtil.applyBuiltInFilter(input: CIImage(image: self.originalImage)!, filter: _filter, intensity: 1.0, context: CIContext())!
                            self.newImage = img.preview
                        }){
//                            Image(uiImage:  ImageUtil.applyBuiltInFilter(input: CIImage(image: self.originalImage)!, filter: _filter, intensity: 1.0, context: CIContext())!)
                            
                                
                                Image(uiImage: img.preview).resizable().frame(width: 70, height: 90)
                            }
                        }
                    }
                }
            }
        }.onAppear{
            self.originalImage = self.image.wrappedValue!
            self.newImage = self.image.wrappedValue!
        }.safeAreaInset(edge: .top, content: {
            VStack{
                HStack{
                    Button(action:{
                        self.displaying.wrappedValue.toggle()
                        self.image.wrappedValue = self.originalImage
                    }){
                        
                        Text("Cancel")
                        
                    }
                    Spacer()
                    Button(action:{
                        self.displaying.wrappedValue.toggle()
                        self.image.wrappedValue = self.newImage
                    }){
                        Text("Done").font(.headline)
                        
                    }
                    
//                    Button("Done"){
//
//                    }
//                    Button("Cancel"){
//
//                    }
//                    Spacer()
//                    Button("Done"){
//
//                    }
                }.padding()
//                Spacer()
            }.padding(.bottom)
            
        })
    }
}

struct FilterSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FilterSelectionView(image: .constant(UIImage(systemName: "person.fill")), displaying: .constant(true))
    }
}
