//
//  MultipleSelectionList.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import SwiftUI

struct MultipleSelectionList: View {
    let buttonText: String
//    let title: String?
//    let subTitle: String?
    let data: [DataMap]
    let action: () -> Void
    var destination: AnyView?
    @State var shouldPresentSheet = true
    @State var selections = [DataMap]()
    var body: some View {
//        Text(title).font(.title)
//        shouldPresentSheet=determineSheetPresentation()
        VStack(alignment: .trailing){
//            VStack(alignment: .center){
                
            Button(action:self.action){
                if self.destination != nil{
                    NavigationLink{
                        AnyView(self.destination)
                    } label: {
                        
                        
                        Text(self.buttonText).padding().background(.blue).font(.headline)
                            .foregroundColor(.white)
                            .clipShape(
                                
                                // 2
                                Capsule()
                            )
                        
                    }
                }else{
                    Text(self.buttonText).padding().background(.blue).font(.headline)
                        .foregroundColor(.white)
                        .clipShape(
                            
                            // 2
                            Capsule()
                        )
                }
                
                
            }.padding(.bottom).padding(.trailing)
            List {
                ForEach(self.data, id: \.self) { item in
                    MultipleSelectionRow(title: item.key,description: item.value ,isSelected: self.selections.contains(item)) {
                        if self.selections.contains(item) {
                            self.selections.removeAll(where: { $0 == item })
                        }
                        else {
                            self.selections.append(item)
                        }
                    }
                }
            }
        }
        
    }

//    func determineSheetPresentation()->Bool{
//        return self.title==nil
//    }
}





struct MultipleSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionList(buttonText:"Submit",data: [DataMap(key: "Fuck", value: "A duck", view: ContentView())],action:{},destination: AnyView(ContentView()))//.environmentObject(GlobalData())
    }
}
