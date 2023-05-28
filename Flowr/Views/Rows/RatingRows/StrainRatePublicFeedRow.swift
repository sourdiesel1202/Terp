//
//  StrainRatePublicFeedRow.swift
//  Flowr
//
//  Created by Andrew on 5/23/23.
//

import SwiftUI

struct StrainRatePublicFeedRow: View {
    let isPublic: Binding <Bool>
    @State private var isShowingFeedHelp: Bool = false
    var body: some View {
        HStack(alignment: .center){
            Toggle("Show in Public Feed", isOn: self.isPublic).padding([.leading,.trailing])
            Spacer()
//            Button{action: }
            Button(action: {self.isShowingFeedHelp=true }){
                Image(systemName: "questionmark.circle").padding([.trailing])
            }.sheet(isPresented: self.$isShowingFeedHelp, content: {
//                Text("")
                ShowInPublicFeedHelpView()
                FullWidthButton(text: "Ok", action: {self.isShowingFeedHelp=false}).padding()
            })
        }
    }
}

struct StrainRatePublicFeedRow_Previews: PreviewProvider {
    static var previews: some View {
        StrainRatePublicFeedRow(isPublic: .constant(true))
    }
}
