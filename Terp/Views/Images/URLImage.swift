//
//  URLImage.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct URLImage: View {
    let url: String
//    let width: CGFloat
//    let height: CGFloat
    let shape: AnyShape
    let alt: String? = ""
    
    var body: some View {
        if self.url.count > 0{
            AsyncImage(
                url: URL(string: url),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                    //                    .frame(maxWidth: self.width, maxHeight: self.height)
                },
                placeholder: {
                    ProgressView()
                }
            ).clipShape(self.shape)
        }else{
            if self.alt != nil{
                CircleText(text: self.alt!, color: .blue)
            }else{
                CircleText(color: .blue)
            }
        }
    }
    
    
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://images.axios.com/pThG3Chccwle6hiHdKOEmnt1vsg=/0x0:1920x1080/1920x1080/2023/01/31/1675201012494.gif", shape: AnyShape(Circle()))
    }
}
