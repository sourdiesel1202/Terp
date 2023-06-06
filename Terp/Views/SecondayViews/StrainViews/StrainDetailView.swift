//
//  SearchView.swift
//  Flowr
// View for the search screen
//  Created by Andrew on 4/30/23.
//

import SwiftUI

struct StrainDetailView: View {
    //    var jsonUtil =
//    let data = Bundle.main.decode([Strain].self, from: "strain_data.json")
    let strain: StrainJSON
    @State private var showingPopover = false
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var rating = 0
    @State private var text = ""
    @State private var notes: String = ""
    var body: some View {
        
//            ForEach(data) {(strain: Strain) in
                VStack {
                    ZStack (alignment: .bottomTrailing){
                        AsyncImage(
                            url: URL(string: strain.image),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 300, maxHeight: 100)
                            },
                            placeholder: {
                                ProgressView()
                            }
                        ).clipShape(Circle())
                        
                        Text("\(strain.name)").padding(4)
                            .background(.black)
                            .font(.caption)
                            .foregroundColor(.white)
                            .offset(x: -5, y: -5)
                    }
                    Text(strain.description)
                        .padding()
//                    NavigationLink(destination: ContentView()) {
//                               Image(systemName: "note.text.badge.plus").imageScale(.large)
//                            Text("Review Strain")
//                            }
                    
                    Button("Review Strain"){
                        showingPopover=true
                    }.frame(maxWidth: .infinity).font(.headline).padding().background(.blue)
                        .foregroundColor(.white)
                        .clipShape(
                            
                            // 2
                            Capsule()
                        ).popover(isPresented: $showingPopover){
                        VStack(alignment: .center){
                        Text("Rate").font(.title).padding(.top)
                        Text(" \(strain.name)").font(.title)
                        
                            
                            RatingView(rating: $rating).padding(.top)
                            
                            Text("Add a note").font(.headline).padding(.top).padding(.top)
                            Text("Optional").font(.caption).padding(.bottom).padding(.bottom)
                            TextField("\(strain.name) notes", text: $notes).padding(.top).font(.headline)
                        }
                        
                        Button(action: {
                            // todo add validation and call API; fix alert timing
                            showAlert=true
                            alertMessage="\(strain.name) rated!"
                            self.showingPopover=false
                            
                            
                        }) {
                            Text("Rate").frame(maxWidth: .infinity).font(.title).padding().background(.blue)
                                .foregroundColor(.white)
                                .clipShape(
                                    
                                    // 2
                                    Capsule()
                                )
                            // How the button looks like
                        }.alert(isPresented: $showAlert) {
                            Alert(title: Text("Alert"), message: Text(alertMessage), dismissButton: .default(Text("Ok")))
                        }
                        }
        //                    Text("Add a description")
                            
                            
                        
                    
////                    Button("Review Strain") {
//
////                        order.add(item: item)
//                    }
//                    .buttonStyle(.borderedProminent)
                }.navigationTitle(strain.name).navigationBarTitleDisplayMode(.inline)
            }
        
//    }
}

struct StrainDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            StrainDetailView(strain: StrainJSON.example)
        }
    }
}
