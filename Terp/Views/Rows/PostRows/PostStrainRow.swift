//
//  PostStrainRow.swift
//  Flowr
//
//  Created by Andrew on 5/17/23.
//

import SwiftUI

struct PostStrainRow: View {
//    let strain: Strain
    let review: Review
    @State private var strain: StrainJSON = StrainJSON.example
    @State private var loading: Bool = true
    @EnvironmentObject var errorHandler: ErrorHandler
    var body: some View {
//        VStack(alignment: .center){
//            Text("Strain")
//        }
        
        VStack(){
//            Divider().padding(.top)
//            NavigationLink(desination: StrainDetailView(strain: strain)){
            if self.loading {
                HStack(alignment: .center){
                    ProgressView().padding([.leading,.trailing])
                    Text("Loading Post Strain").font(.caption)
                    
                }
            } else{
            NavigationLink{
                StrainDetail2_0View(strain: self.strain) //todo handle this
            }label: {
                
                
                HStack{
                    
                    Text("Strain: ").fontWeight(.bold).padding(.leading)
                    Text(review.strain)
                    Spacer()
                    ForEach(1..<5 + 1, id: \.self) { number in
                        if number <= review.rating{
                            Image(systemName: "star.fill").foregroundColor(.blue)
                        }else{
                            Image(systemName: "star").foregroundColor(.blue)
                        }
                        //                            image(for: number).resizable().scaledToFit()
                        //                                .foregroundColor(number > rating ? offColor : onColor)
                        //                                .onTapGesture {
                        //                                    rating = number
                        //                                }
                    }
                    //                        if strain.image.count == 0{
                    //                            Image(systemName: "leaf.circle").resizable()
                    //                                .aspectRatio(contentMode: .fit)
                    //                                .frame(maxWidth: 90, maxHeight: 40).clipShape(Circle())
                    //                            //                SystemImageRow(text: strain, img: <#T##String#>)
                    //                        }else{
                    //                            AsyncImage(
                    //                                url: URL(string: strain.image),
                    //                                content: { image in
                    //                                    image.resizable()
                    //                                        .aspectRatio(contentMode: .fit)
                    //                                        .frame(maxWidth: 90, maxHeight: 40)
                    //                                },
                    //                                placeholder: {
                    //                                    ProgressView()
                    //                                }
                    //                            ).clipShape(Circle())
                    //
                    //                        }
                    
                }
            }
            }//.foregroundColor(.black)
//                Divider().padding(.bottom)
                
        }.onAppear{
            DispatchQueue.global(qos: .utility).async {
                do{
                    let strainData = try StrainJSONUtil.loadStrainByName(name: self.review.strain)
                    
                    //                let _strain = StrainJSONUtil.loadStrainByName(name: T##String)
                    DispatchQueue.main.async {
                        self.strain = strainData
                        //                    self.children = children
                        //                    self.parents = parents
                        //                    self.searchResults = _searchResults
                        //                        self.strains = strainData
                        self.loading = false
                    }
                }catch{
                    self.errorHandler.handle(error: error)
                }
            }
        }
        
    }
//    }
}

struct PostStrainRow_Previews: PreviewProvider {
    static var previews: some View {
        PostStrainRow(review: Review.example)
    }
}
