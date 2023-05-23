//
//  ProfileTerpeneRow.swift
//  Flowr
//
//  Created by Andrew on 5/18/23.
//

import SwiftUI

struct ProfileTerpeneRow: View {
    let user: User
    private var terpeneProfile: TerpeneProfile{
        return TerpeneUtil.loadTerpeneProfileByUser(user: self.user)
    }
    
//    private var effects: [String]{
    var body: some View {
        
        VStack(alignment: .leading){
//            ViewDivider(height: 0.5)
            HStack{
                Text("Terpene Profile").padding([.leading,.bottom]).font(.caption).fontWeight(.bold)
            }
            HStack{
                Text("Terpenes (\(self.terpeneProfile.terpenes.count))").padding([.leading,.bottom]).font(.caption)
                Spacer()
                NavigationLink{
                    ContentView()
                }label: {
                    Text("View All").font(.caption).padding([.bottom,.trailing])
                }
                
            }
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(self.terpeneProfile.terpenes, id: \.self){ (terpene: String) in
                        NavigationLink{
                            TerpeneDetailView(terpene: TerpeneUtil.loadTerpeneByName(name: terpene))
                        } label: {
                            VStack{
                                CircleText(text: terpene, color: .blue)
                                Text(terpene).font(.caption).fontWeight(.bold)
                                
                            }
                        }.padding([.leading,.trailing])
                    }
                    
                }
            }
            
//            ViewDivider(height: 0.25)
            ViewDivider(height: 0.5)
            HStack{
                Text("Aromas (\(self.terpeneProfile.aromas.count))").padding([.leading,.bottom]).font(.caption)
                Spacer()
                NavigationLink{
                    ContentView()
                }label: {
                    Text("View All").font(.caption).padding([.bottom,.trailing])
                }
                
            }
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(self.terpeneProfile.aromas, id: \.self){ (aroma: String) in
                        NavigationLink{
                            TerpeneEffectAromaView(title: aroma, description: DictionaryUtil.loadDescription(text: aroma))
                            
                        } label: {
                            VStack{
                                CircleText(text: aroma, color: .blue)
                                Text(aroma).font(.caption).fontWeight(.bold)
                                
                            }
                        }.padding([.leading,.trailing])
                    }
                    
                }
            }
            ViewDivider(height: 0.5)
//            ViewDivider(height: 0.25)
            Section{
                HStack{
                    Text("Effects (\(self.terpeneProfile.effects.count))").padding([.leading,.bottom]).font(.caption)
                    Spacer()
                    NavigationLink{
                        ContentView()
                    }label: {
                        Text("View All").font(.caption).padding([.bottom,.trailing])
                    }
                    
                }
            }
            
//                  ViewDivider(height: 0.12)
            ScrollView(.horizontal){
                HStack(alignment: .top){
                    ForEach(self.terpeneProfile.effects, id: \.self){ (effect: String) in
                        NavigationLink{
                            TerpeneEffectAromaView(title: effect, description: DictionaryUtil.loadDescription(text: effect))
                            
                        } label: {
                            VStack{
                                CircleText(text: effect, color: .blue)
                                Text(effect).font(.caption).fontWeight(.bold)
                                
                            }
                        }.padding([.leading,.trailing])
                    }
                    
                }
                
            }.padding(.bottom)
            NavigationLink{
                TerpeneProfileView(user: self.user, terpeneProfile: TerpeneUtil.loadTerpeneProfileByUser(user: self.user))
//                TerpeneProfileView(searchText: <#T##arg#>, globalData: <#T##GlobalData#>, navigationUtil: <#T##NavigationUtil#>, isPresentingEditEffectSheet: <#T##Bool#>, isPresentingBuildEffectSheet: <#T##Bool#>, isPresentingEditAromaSheet: <#T##Bool#>, isPresentingBuildAromaSheet: <#T##Bool#>, effectSelections: <#T##arg#>, aromaSelections: <#T##arg#>)
            } label: {
                FullWidthText(text: "Edit Terpene Profile")
//                FullWidthButton(text: "Edit Terpene Profile", action: {}).padding([ .leading,.trailing,.top])
            }
            }
        
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ProfileTerpeneRow_Previews: PreviewProvider {
    static var previews: some View {
        ProfileTerpeneRow(user: User.example)
    }
}
