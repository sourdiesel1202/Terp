//
//  MessageRecievedRow.swift
//  Flowr
//
//  Created by Andrew on 5/30/23.
//

import SwiftUI

struct MessageRecievedRow: View {
    let message: Message
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct MessageRecievedRow_Previews: PreviewProvider {
    static var previews: some View {
        MessageRecievedRow(message: Message.example)
    }
}
