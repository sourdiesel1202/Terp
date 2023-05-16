//
//  TerpeneProfileAromaView.swift
//  Flowr
//
//  Created by Andrew on 5/15/23.
//

import SwiftUI

struct TerpeneProfileEditView: View {
    var data: [DataMap]
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        Section{
//            MultipleSelectionList(data: TerpeneUtil.loadAromaDataMap(terpenes: globalData.terpenes, strains: globalData.strains) )
            //                                MultipleSelectionList(data: <#T##[DataMap]#>, navigationUtil: <#T##NavigationUtil#>)
        }
        Section{
            Button(action: {
                //                self.showingAromaList=false
                //                self.showingEffectHelp=true
                //                self.showingAromaHelp=false
                //                self.showingAromaList=false
                ////                                    self.showingEffectHelp=true
            }) {
                Text("Next").frame(maxWidth: .infinity).font(.subheadline).padding().background(.blue)
                    .foregroundColor(.white)
                    .clipShape(
                        
                        // 2
                        Capsule()
                    )
            }.padding(.bottom)
        }
        
    }
}

struct TerpeneProfileEditView_Previews: PreviewProvider {
    static var previews: some View {
        TerpeneProfileEditView(data: [DataMap(key: "Test", value: "test", view: ContentView())])//.environmentObject(GlobalData())
    }
}
