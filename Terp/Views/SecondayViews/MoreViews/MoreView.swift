//
//  MoreView.swift
//  Flowr
//
//  Created by Andrew on 5/26/23.
//

import SwiftUI

struct MoreView: View {
    var body: some View {
//        ScrollView(.vertical){
//            Section{
//        Section{
//            MoreAccountRow()
//        }
//        MoreHeaderRow()
        NavigationStack{
            List{
                MoreAccountRow()
                MoreTerpeneRow()
            }.navigationTitle(Text("More").font(.title).fontWeight(.bold))
        }
//            }.navigationTitle(<#T##title: Text##Text#>)
//        }.navigationTitle("More")
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreView()
    }
}
