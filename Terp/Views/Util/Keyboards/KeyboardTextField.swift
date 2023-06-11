//
//  KeyboardTextField.swift
//  Flowr
//
//  Created by Andrew on 5/27/23.
//

import SwiftUI

struct KeyboardTextField: View {
    enum FocusedField{
        case hide, textField
    }
    
    let hint: String
    let buttonText: String
    @State var text: Binding<String>
    let action: ()->Void
    
//    @State private var text: String = ""
    @State private var name: String = ""
    @State private var reload: Bool = false
    @FocusState private var focus: Bool
    @FocusState private var focusToolbar: Bool
    var body: some View {
        TextField("", text: $name).focused($focus).opacity(0)
                    .textFieldStyle(.roundedBorder)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            HStack{
                                TextField(self.hint, text: text).focused(self.$focusToolbar).padding([.trailing])
                                Button(action: self.action) {
                                    Text(self.buttonText)
                                }
//                                Button(self.buttonText) {
//                                    print("Clicked")
//                                }
                            }
                        }
                    }.onAppear{
                        self.focus = true
//                        self.focus = false
                        self.focusToolbar = true
                        self.reload.toggle()
//                        self.focus = false
                        
                        
                    }
    }
}

struct KeyboardTextField_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardTextField(hint: "Fuck", buttonText: "Post", text: .constant("Test"), action:{print("Fuck")})
    }
}
