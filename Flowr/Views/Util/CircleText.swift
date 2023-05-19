//
//  CircleText.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct CircleText: View {
    @State var text: String = "Reaaaallllllyyyyyy Looooooongggggg"
    // Make this any number you are comfortable with
    var color: Color
    @State var letterLimit: Int = 2
    var body: some View {
        
        Circle()
            .frame(width: 75, height: 75).overlay(Color.blue.background(.blue).clipShape(Circle()))
            .overlay(
                Text(text.prefix(letterLimit)).font(.title)
                    //Limit to 1 line until your letterLimit
//                    .lineLimit(text.count <= letterLimit ? 1 : nil)
                    //Clips it to shape
                    .clipShape(ContainerRelativeShape()).padding()
                    .foregroundColor(.white)
                    //This makes super tiny letters so adjust to your use case
//                    .minimumScaleFactor(20)

            )
    }
}
struct CircleText_Previews: PreviewProvider {
    static var previews: some View {
        CircleText(text: "Fuck", color: .blue, letterLimit: 2)
    }
}
