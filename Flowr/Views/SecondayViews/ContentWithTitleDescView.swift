//
//  ContentWithTitleDescView.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import SwiftUI

struct ContentWithTitleDescView: View {
    let title: String
    let desc: String
    let image: String?
    var body: some View {
        VStack (alignment: .center){
            if self.image != nil{
                Image(systemName: self.image!).resizable()
                    .aspectRatio(contentMode: .fit).padding(.bottom)
            }
            
            Text(self.title).font(.title).padding(.top)
            Text(self.desc).font(.subheadline)
        }
    }
}

struct ContentWithTitleDescView_Previews: PreviewProvider {
    static var previews: some View {
        ContentWithTitleDescView(title: "Hello", desc: "This is some data", image: nil)
    }
}
