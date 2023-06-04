//
//  KeyboardTextField.swift
//  Flowr
//
//  Created by Andrew on 5/27/23.
//

import SwiftUI

struct KeyboardTextField: View {
    @State private var text: String = ""
    @FocusState private var focus: Bool
    @FocusState private var focusToolbar: Bool
    var body: some View {
        ZStack {
                    VStack{
                        Spacer()
                        TextField("toolbar", text: $text)
                            .textFieldStyle(.roundedBorder)
                            .opacity(focus || focusToolbar ? 0 : 1)
                            .focused($focus)
                    }
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard){
                            TextField("toolbar", text: $text)
                                .textFieldStyle(.roundedBorder)
                                .focused($focusToolbar)
                        }
                    }
                    .onChange(of: focus) {
                        if $0{
                            focusToolbar = true
                        }
                    }
                }
    }
}

struct KeyboardTextField_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardTextField()
    }
}
