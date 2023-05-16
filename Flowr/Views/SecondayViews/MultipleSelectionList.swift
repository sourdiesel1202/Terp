//
//  MultipleSelectionList.swift
//  Flowr
//
//  Created by Andrew on 5/13/23.
//

import SwiftUI

struct MultipleSelectionList: View {
//    let buttonText:/ String
//    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var searchText = ""
//    let title: String?
//    let subTitle: String?
//    let action: ()-> Void
    let data: [DataMap]
    var navigationBarTitle: String?
    let action: ()-> Void
    @State var selections = [DataMap]()
//    @EnvironmentObject var navigationUtil: NavigationUtil
    @EnvironmentObject var navigationUtil: NavigationUtil
    var body: some View {
        
            //        Text(title).font(.title)
            //        shouldPresentSheet=determineSheetPresentation()
        NavigationStack{
            //            VStack(alignment: .center){
            
//            Section{
//                HStack{
//                    BasicButton(text: "Back", font: .headline, action: self.action).padding(.leading)
//                    Spacer()
//                    BasicButton(text: "Done", font: .headline, action: self.action).padding(.trailing)
//                }
//            }
////            Section{
//                VStack(alignment: .center){
//                    Text(self.navigationBarTitle != nil ?  self.navigationBarTitle!: "").font(.title)
//                }
//            }
            Section{
                List {
                    ForEach(searchResults, id: \.self) { item in
                        
                        MultipleSelectionRow(title: item.key,description: item.value ,isSelected: self.selections.contains(item)) {
                            if self.selections.contains(item) {
                                self.selections.removeAll(where: { $0 == item })
                            }
                            else {
                                self.selections.append(item)
                            }
                        }
                    }
                }.searchable(text: $searchText)
            }.toolbar(content: {
                
                ToolbarItem(placement: .navigationBarLeading){
                    BasicButton(text: "Back", font: .headline, action: self.action).padding(.bottom).padding(.bottom)
                    
                }
                ToolbarItem(placement: .navigationBarTrailing){
                                    BasicButton(text: "Done", font: .headline, action: self.action).padding(.bottom).padding(.bottom)
                                }

            })
            
        }
    }
    
        
    var searchResults: [DataMap] {
            if searchText.isEmpty {
                return data
            } else {
                return data.filter { $0.key.lowercased().contains(searchText.lowercased()) || $0.value.lowercased().contains(searchText.lowercased()) }
            }
        }

//    func determineSheetPresentation()->Bool{
//        return self.title==nil
//    }
}





struct MultipleSelectionList_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionList(data: [DataMap(key: "Fuck", value: "A duck", view: ContentView())],action:{}).environmentObject(NavigationUtil())
    }
}
