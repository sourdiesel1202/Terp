//
//  PostSettingsView.swift
//  Terp
//
//  Created by Andrew on 6/28/23.
//

import SwiftUI

struct PostSettingsView: View {
    @State private var publicPosts: Bool = false
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        VStack{
            ScrollView(.vertical){
                Text("Post Settings").font(.largeTitle).fontWeight(.bold).padding(.bottom)
                Text("Make changes to your post settings, including privacy, etc").padding([.leading, .trailing, .bottom])
                Toggle("Make Posts Public", isOn: self.$publicPosts).padding([.trailing, .leading]).onChange(of: self.publicPosts){ value in
                    self.globalData.isPostPublic = value
                }.onAppear{
                    self.publicPosts = self.globalData.isPostPublic
                }
                
            }
        }
        
    }
}

struct PostSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        PostSettingsView()
    }
}
